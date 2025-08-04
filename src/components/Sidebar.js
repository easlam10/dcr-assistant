"use client";

import { Plus, MessageCircle, Settings, User } from "lucide-react";
import { cn } from "@/lib/utils";

export default function Sidebar({
  chats = [],
  currentChatId,
  onNewChat,
  onSelectChat,
  onSettings,
  onAccount,
}) {
  return (
    <div className="w-64 bg-gray-900 border-r border-gray-700 flex flex-col h-full">
      {/* Header */}
      <div className="p-4 border-b border-gray-700">
        <h1 className="text-xl font-bold text-white mb-4">Chat Agent</h1>
        <button
          onClick={onNewChat}
          className="w-full bg-purple-600 hover:bg-purple-700 text-white rounded-lg px-4 py-2 flex items-center justify-center gap-2 transition-colors"
        >
          <Plus className="w-4 h-4" />
          New Chat
        </button>
      </div>

      {/* Chat History */}
      <div className="flex-1 overflow-y-auto p-4">
        <div className="space-y-2">
          {chats.map((chat) => (
            <button
              key={chat.id}
              onClick={() => onSelectChat(chat.id)}
              className={cn(
                "w-full text-left p-3 rounded-lg flex items-center gap-3 transition-colors",
                currentChatId === chat.id
                  ? "bg-purple-600 text-white"
                  : "text-gray-300 hover:bg-gray-800"
              )}
            >
              <MessageCircle className="w-4 h-4 flex-shrink-0" />
              <span className="truncate">{chat.title}</span>
            </button>
          ))}
        </div>
      </div>

      {/* Footer */}
      <div className="p-4 border-t border-gray-700 space-y-2">
        <button
          onClick={onSettings}
          className="w-full text-left p-3 rounded-lg flex items-center gap-3 text-gray-300 hover:bg-gray-800 transition-colors"
        >
          <Settings className="w-4 h-4" />
          Settings
        </button>
        <button
          onClick={onAccount}
          className="w-full text-left p-3 rounded-lg flex items-center gap-3 text-gray-300 hover:bg-gray-800 transition-colors"
        >
          <User className="w-4 h-4" />
          Account
        </button>
      </div>
    </div>
  );
}
