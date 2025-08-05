import { GoogleGenerativeAI } from "@google/generative-ai";
import { searchUserData, getDataStats } from "./sampleData";

const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY);

export async function generateResponse(userMessage, databaseContext = []) {
  try {
    const model = genAI.getGenerativeModel({ model: "gemini-2.0-flash" });

    // Search the sample data for relevant information
    const searchResults = searchUserData(userMessage);
    const stats = getDataStats();

    // Create context from search results
    let contextText = "";
    if (searchResults.length > 0) {
      contextText =
        "\n\nRelevant User Data:\n" +
        searchResults
          .map((user, index) => {
            return `User ${index + 1}: ID=${user.user_id}, Username=${
              user.username
            }, Name=${user.first_name} ${user.last_name}, Gender=${
              user.gender
            }`;
          })
          .join("\n");
    }

    // Add general statistics
    contextText +=
      `\n\nDatabase Statistics:\n` +
      `- Total Users: ${stats.totalUsers}\n` +
      `- Male Users: ${stats.maleUsers}\n` +
      `- Female Users: ${stats.femaleUsers}\n` +
      `- Most Common First Names: ${stats.mostCommonFirstNames
        .map((n) => `${n.name} (${n.count})`)
        .join(", ")}\n`;

    const prompt = `You are an AI assistant for a user management system. You have access to user data from a database.

Your role is to help users with questions about:
- User information and profiles
- User statistics and demographics
- Searching for specific users
- Gender distribution
- Name analysis
- Any other user-related queries

${contextText}

User Question: ${userMessage}

Please provide a helpful, accurate response based on the user data provided. If the data doesn't contain relevant information, clearly state that you don't have specific data for that query.

Keep your responses concise, professional, and user-focused. When providing statistics, be specific with numbers.`;

    const result = await model.generateContent(prompt);
    const response = await result.response;
    return response.text();
  } catch (error) {
    console.error("Gemini API error:", error);
    return "I apologize, but I encountered an error while processing your request. Please try again.";
  }
}

// export async function generateEmbedding(text) {
//   try {
//     const model = genAI.getGenerativeModel({ model: "embedding-001" });
//     const result = await model.embedContent(text);
//     return result.embedding;
//   } catch (error) {
//     console.error("Embedding generation error:", error);
//     return null;
//   }
// }
