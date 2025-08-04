"use client";

import { useState } from "react";
import Sidebar from "@/components/Sidebar";
import ChatInterface from "@/components/ChatInterface";

export default function Home() {
  const [chats, setChats] = useState([
    { id: "1", title: "Chat 1" },
    { id: "2", title: "Chat 2" },
    { id: "3", title: "Chat 3" },
    { id: "4", title: "Chat 4" },
  ]);
  const [currentChatId, setCurrentChatId] = useState("1");

  const handleNewChat = () => {
    const newChat = {
      id: Date.now().toString(),
      title: `Chat ${chats.length + 1}`,
    };
    setChats((prev) => [newChat, ...prev]);
    setCurrentChatId(newChat.id);
  };

  const handleSelectChat = (chatId) => {
    setCurrentChatId(chatId);
  };

  const handleSettings = () => {
    console.log("Settings clicked");
    // Implement settings functionality
  };

  const handleAccount = () => {
    console.log("Account clicked");
    // Implement account functionality
  };

  return (
    <div className="flex h-screen bg-gray-950">
      <Sidebar
        chats={chats}
        currentChatId={currentChatId}
        onNewChat={handleNewChat}
        onSelectChat={handleSelectChat}
        onSettings={handleSettings}
        onAccount={handleAccount}
      />
      <div className="flex-1 flex flex-col">
        <ChatInterface />
      </div>
    </div>
  );
}
