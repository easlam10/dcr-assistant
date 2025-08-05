'use client';

import { cn } from '@/lib/utils';
import { User, Bot } from 'lucide-react';
import ReactMarkdown from 'react-markdown';
import remarkGfm from 'remark-gfm';

export default function ChatMessage({ message, isUser = false }) {
  return (
    <div className={cn(
      "flex gap-3 p-4 message-animate",
      isUser ? "justify-end" : "justify-start"
    )}>
      {!isUser && (
        <div className="flex-shrink-0 w-8 h-8 bg-blue-500 rounded-full flex items-center justify-center shadow-sm">
          <Bot className="w-4 h-4 text-white" />
        </div>
      )}
      
      <div className={cn(
        "max-w-[80%] rounded-xl px-4 py-3 shadow-sm",
        isUser 
          ? "bg-blue-500 text-white" 
          : "bg-white text-gray-800 border border-gray-100"
      )}>
        <ReactMarkdown 
          remarkPlugins={[remarkGfm]}
          className="prose max-w-none"
          components={{
            p: ({ children }) => <p className="mb-2 last:mb-0">{children}</p>,
            ul: ({ children }) => <ul className="list-disc list-inside mb-2">{children}</ul>,
            ol: ({ children }) => <ol className="list-decimal list-inside mb-2">{children}</ol>,
            li: ({ children }) => <li className="mb-1">{children}</li>,
            strong: ({ children }) => <strong className="font-semibold">{children}</strong>,
            em: ({ children }) => <em className="italic">{children}</em>,
            code: ({ children }) => (
              <code className="bg-gray-100 px-1 py-0.5 rounded text-sm font-mono">
                {children}
              </code>
            ),
            pre: ({ children }) => (
              <pre className="bg-gray-100 p-3 rounded-lg overflow-x-auto mb-2">
                {children}
              </pre>
            ),
          }}
        >
          {message}
        </ReactMarkdown>
      </div>
      
      {isUser && (
        <div className="flex-shrink-0 w-8 h-8 bg-gray-200 rounded-full flex items-center justify-center shadow-sm">
          <User className="w-4 h-4 text-gray-600" />
        </div>
      )}
    </div>
  );
}