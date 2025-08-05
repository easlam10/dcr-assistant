"use client";

import { Plus, MessageCircle, Settings, User, ChevronLeft, ChevronRight } from "lucide-react";
import { useState } from "react";
import { cn } from "@/lib/utils";

export default function Sidebar({
  chats = [],
  currentChatId,
  onNewChat,
  onSelectChat,
  onSettings,
  onAccount,
}) {
  const [isCollapsed, setIsCollapsed] = useState(false);

  return (
    <div className={cn(
      "flex flex-col h-full transition-all duration-300 ease-in-out",
      isCollapsed ? "w-20" : "w-64"
    )}>
      <div className={cn(
        "flex-1 flex flex-col bg-gradient-to-b from-gray-50 to-gray-100 border-r border-gray-200",
        isCollapsed ? "items-center" : ""
      )}>
        {/* Header */}
        <div className={cn(
          "p-4 border-b border-gray-200",
          isCollapsed ? "w-full" : ""
        )}>
          {isCollapsed ? (
            <div className="flex justify-center">
              <div className="w-10 h-10 rounded-full bg-blue-500 flex items-center justify-center text-white font-bold">
                CA
              </div>
            </div>
          ) : (
            <>
              <h1 className="text-xl font-semibold text-gray-800 mb-4">Chat Assistant</h1>
              <button
                onClick={onNewChat}
                className="w-full bg-blue-500 hover:bg-blue-600 text-white rounded-lg px-4 py-2 flex items-center justify-center gap-2 transition-colors shadow-sm"
              >
                <Plus className="w-4 h-4" />
                New Chat
              </button>
            </>
          )}
        </div>

        {/* Chat History */}
        <div className="flex-1 overflow-y-auto p-4">
          <div className="space-y-1">
            {chats.map((chat) => (
              <button
                key={chat.id}
                onClick={() => onSelectChat(chat.id)}
                className={cn(
                  "w-full text-left p-3 rounded-lg flex items-center gap-3 transition-colors",
                  currentChatId === chat.id
                    ? "bg-blue-100 text-blue-600"
                    : "text-gray-600 hover:bg-gray-100",
                  isCollapsed ? "justify-center" : ""
                )}
              >
                <MessageCircle className="w-4 h-4 flex-shrink-0" />
                {!isCollapsed && (
                  <span className="truncate">{chat.title}</span>
                )}
              </button>
            ))}
          </div>
        </div>

        {/* Footer */}
        <div className="p-4 border-t border-gray-200 space-y-1">
          <button
            onClick={onSettings}
            className={cn(
              "w-full text-left p-3 rounded-lg flex items-center gap-3 text-gray-600 hover:bg-gray-100 transition-colors",
              isCollapsed ? "justify-center" : ""
            )}
          >
            <Settings className="w-4 h-4" />
            {!isCollapsed && "Settings"}
          </button>
          <button
            onClick={onAccount}
            className={cn(
              "w-full text-left p-3 rounded-lg flex items-center gap-3 text-gray-600 hover:bg-gray-100 transition-colors",
              isCollapsed ? "justify-center" : ""
            )}
          >
            <User className="w-4 h-4" />
            {!isCollapsed && "Account"}
          </button>
        </div>

        {/* Collapse Button */}
        <button
          onClick={() => setIsCollapsed(!isCollapsed)}
          className="p-2 text-gray-500 hover:bg-gray-100 rounded-full m-2 self-end"
        >
          {isCollapsed ? <ChevronRight className="w-5 h-5" /> : <ChevronLeft className="w-5 h-5" />}
        </button>
      </div>
    </div>
  );
}