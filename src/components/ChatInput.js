"use client";

import { useState, useRef } from "react";
import { Send, Mic, MicOff } from "lucide-react";
import { cn } from "@/lib/utils";

export default function ChatInput({ onSendMessage, isLoading = false }) {
  const [message, setMessage] = useState("");
  const [isRecording, setIsRecording] = useState(false);
  const mediaRecorderRef = useRef(null);
  const audioChunksRef = useRef([]);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (message.trim() && !isLoading) {
      onSendMessage(message.trim());
      setMessage("");
    }
  };

  const toggleRecording = async () => {
    if (isRecording) {
      // Stop recording
      mediaRecorderRef.current?.stop();
      setIsRecording(false);
    } else {
      try {
        const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
        const mediaRecorder = new MediaRecorder(stream);
        mediaRecorderRef.current = mediaRecorder;
        audioChunksRef.current = [];

        mediaRecorder.ondataavailable = (event) => {
          if (event.data.size > 0) {
            audioChunksRef.current.push(event.data);
          }
        };

        mediaRecorder.onstop = () => {
          const audioBlob = new Blob(audioChunksRef.current, { type: "audio/webm" });
          // Handle the audio blob here if needed
          console.log("Recorded audio blob:", audioBlob);
        };

        mediaRecorder.start();
        setIsRecording(true);
      } catch (err) {
        console.error("Error accessing microphone:", err);
      }
    }
  };

  return (
    <div className="border-t border-gray-200 bg-white p-4 shadow-sm">
      <form onSubmit={handleSubmit} className="flex items-center gap-2">
        <div className="flex-1 relative">
          <input
            type="text"
            value={message}
            onChange={(e) => setMessage(e.target.value)}
            placeholder="Type your message..."
            className="w-full bg-gray-50 border border-gray-200 rounded-full px-4 py-3 text-gray-800 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent shadow-sm"
            disabled={isLoading}
          />
        </div>

        <button
          type="button"
          onClick={toggleRecording}
          className={cn(
            "p-3 rounded-full transition-colors",
            isRecording
              ? "bg-red-500 hover:bg-red-600 text-white"
              : "bg-gray-100 hover:bg-gray-200 text-gray-600"
          )}
          disabled={isLoading}
        >
          {isRecording ? (
            <MicOff className="w-5 h-5" />
          ) : (
            <Mic className="w-5 h-5" />
          )}
        </button>

        <button
          type="submit"
          disabled={!message.trim() || isLoading}
          className={cn(
            "p-3 rounded-full transition-colors",
            message.trim() && !isLoading
              ? "bg-blue-500 hover:bg-blue-600 text-white"
              : "bg-gray-100 text-gray-400 cursor-not-allowed"
          )}
        >
          <Send className="w-5 h-5" />
        </button>
      </form>
    </div>
  );
}
