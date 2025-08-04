import { GoogleGenerativeAI } from "@google/generative-ai";

const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY);

export async function generateResponse(userMessage, databaseContext = []) {
  try {
    const model = genAI.getGenerativeModel({ model: "gemini-2.0-flash" });

    // Create context from database results
    let contextText = "";
    if (databaseContext.length > 0) {
      contextText =
        "\n\nDatabase Context:\n" +
        databaseContext
          .map((item, index) => {
            const { source_table, ...data } = item;
            return `Record ${
              index + 1
            } (from ${source_table}):\n${JSON.stringify(data, null, 2)}`;
          })
          .join("\n\n");
    }

    const prompt = `You are an AI assistant for a KIPS ERP (Educational Management System). 
    
Your role is to help users with questions about:
- Student admissions and applications
- Academic programs and disciplines
- Campus information
- Fee structures and payments
- Staff information
- Academic sessions and schedules
- Any other educational management related queries

${contextText}

User Question: ${userMessage}

Please provide a helpful, accurate response based on the database context provided. If the context doesn't contain relevant information, you can provide general guidance about educational management systems, but clearly state that you don't have specific data for that query.

Keep your responses concise, professional, and educational-focused.`;

    const result = await model.generateContent(prompt);
    const response = await result.response;
    return response.text();
  } catch (error) {
    console.error("Gemini API error:", error);
    return "I apologize, but I encountered an error while processing your request. Please try again.";
  }
}

export async function generateEmbedding(text) {
  try {
    const model = genAI.getGenerativeModel({ model: "embedding-001" });
    const result = await model.embedContent(text);
    return result.embedding;
  } catch (error) {
    console.error("Embedding generation error:", error);
    return null;
  }
}
