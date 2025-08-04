import { NextResponse } from 'next/server';
import { searchDatabase } from '@/lib/db';
import { generateResponse } from '@/lib/gemini';

export async function POST(request) {
  try {
    const { message } = await request.json();

    if (!message || typeof message !== 'string') {
      return NextResponse.json(
        { error: 'Message is required and must be a string' },
        { status: 400 }
      );
    }

    // Search database for relevant context
    const databaseContext = await searchDatabase(message);

    // Generate AI response with database context
    const aiResponse = await generateResponse(message, databaseContext);

    return NextResponse.json({
      response: aiResponse,
      context: databaseContext,
      timestamp: new Date().toISOString()
    });

  } catch (error) {
    console.error('Chat API error:', error);
    return NextResponse.json(
      { error: 'Internal server error' },
      { status: 500 }
    );
  }
} 