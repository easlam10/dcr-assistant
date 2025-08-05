"use client";

export default function SuggestedPrompts({ onSelectPrompt }) {
  const prompts = [
    "How do I check admission status?",
    "What are the available programs?",
    "Explain the fee structure",
    "How to reset my password?"
  ];

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 gap-3 w-full max-w-2xl">
      {prompts.map((prompt, index) => (
        <button
          key={index}
          onClick={() => onSelectPrompt(prompt)}
          className="bg-white border border-gray-200 rounded-xl p-4 text-left hover:bg-gray-50 transition-colors shadow-sm hover:border-blue-300"
        >
          <div className="text-sm text-gray-600">{prompt}</div>
        </button>
      ))}
    </div>
  );
}