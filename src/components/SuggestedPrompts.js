"use client";

export default function SuggestedPrompts({ onSelectPrompt }) {
  const prompts = [
    "What programs are available for admission?",
    "Tell me about the fee structure for different programs.",
    "How many campuses does KIPS have?",
    "What are the admission requirements?",
  ];

  return (
    <div className="flex flex-wrap gap-3 justify-center">
      {prompts.map((prompt, index) => (
        <button
          key={index}
          onClick={() => onSelectPrompt(prompt)}
          className="bg-gray-800 hover:bg-gray-700 text-gray-300 px-4 py-2 rounded-lg transition-colors border border-gray-600 hover:border-gray-500"
        >
          {prompt}
        </button>
      ))}
    </div>
  );
}
