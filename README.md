# KIPS ERP AI Assistant

A ChatGPT-like AI assistant specifically designed for the KIPS ERP (Educational Management System) that can answer questions based on your database content.

## Features

- 🤖 **AI-Powered Responses**: Uses Google Gemini API to generate intelligent responses
- 🗄️ **Database Integration**: Searches through your MySQL database for relevant context
- 💬 **ChatGPT-like Interface**: Modern, elegant chat interface with dark theme
- 🎤 **Voice Input**: Voice recording capability (ready for speech-to-text integration)
- 📱 **Responsive Design**: Works on desktop and mobile devices
- 🔍 **Smart Search**: Searches across multiple database tables for relevant information
- 📝 **Markdown Support**: Rich text formatting in responses

## Tech Stack

- **Frontend**: Next.js 15, React 19, Tailwind CSS
- **Backend**: Next.js API Routes
- **Database**: MySQL (with mysql2)
- **AI**: Google Gemini API
- **UI Components**: Lucide React icons

## Database Schema

The assistant is designed to work with the KIPS ERP database schema, which includes tables for:
- Student admissions and applications
- Academic programs and disciplines
- Campus information
- Fee structures and payments
- Staff information
- Academic sessions and schedules

## Quick Start

### 1. Install Dependencies

```bash
npm install
```

### 2. Environment Setup

Copy the example environment file and configure your settings:

```bash
cp env.example .env.local
```

Edit `.env.local` with your configuration:

```env
# Database Configuration
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=db_kips_erp
DB_PORT=3306

# Gemini API Configuration
GEMINI_API_KEY=your_gemini_api_key_here
```

### 3. Database Setup

1. Import your database schema:
   ```bash
   mysql -u root -p db_kips_erp < "Selected for DCR.sql"
   ```

2. Ensure your database is running and accessible

### 4. Run the Development Server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to view the application.

## How It Works

### 1. User Query Processing
When a user sends a message, the system:
1. Receives the query via the chat interface
2. Sends it to the `/api/chat` endpoint

### 2. Database Search
The API endpoint:
1. Searches the database for relevant information using the `searchDatabase` function
2. Looks across multiple tables (applicants, programs, campuses, etc.)
3. Uses LIKE queries to find matching content

### 3. AI Response Generation
The system:
1. Takes the database context and user query
2. Sends both to the Gemini API with a specialized prompt
3. Generates a contextual response based on the database data

### 4. Response Delivery
The AI response is:
1. Formatted with markdown support
2. Displayed in the chat interface
3. Stored in the conversation history

## API Endpoints

### POST /api/chat
Handles chat messages and generates AI responses.

**Request Body:**
```json
{
  "message": "What programs are available?"
}
```

**Response:**
```json
{
  "response": "Based on the database, the following programs are available...",
  "context": [...],
  "timestamp": "2024-01-01T00:00:00.000Z"
}
```

## Customization

### Adding New Database Tables
To include additional tables in the search:

1. Edit `src/lib/db.js`
2. Add your table name to the `tables` array in the `searchDatabase` function
3. The system will automatically search text columns in the new table

### Modifying AI Prompts
To customize the AI behavior:

1. Edit `src/lib/gemini.js`
2. Modify the prompt template in the `generateResponse` function
3. Adjust the system instructions to match your specific use case

### Voice Input Integration
To add speech-to-text functionality:

1. Get a Google Speech-to-Text API key
2. Add it to your `.env.local`
3. Implement the speech-to-text conversion in `ChatInput.js`

## Deployment

### Vercel Deployment
1. Push your code to GitHub
2. Connect your repository to Vercel
3. Add environment variables in Vercel dashboard
4. Deploy

### Database Hosting
For production, consider using:
- **PlanetScale** (MySQL-compatible)
- **Railway** (MySQL hosting)
- **AWS RDS** (MySQL)
- **Google Cloud SQL** (MySQL)

## Troubleshooting

### Database Connection Issues
- Verify your database credentials in `.env.local`
- Ensure MySQL is running and accessible
- Check firewall settings if using remote database

### Gemini API Issues
- Verify your API key is correct
- Check API quota and billing
- Ensure the API key has proper permissions

### Build Issues
- Clear Next.js cache: `rm -rf .next`
- Reinstall dependencies: `rm -rf node_modules && npm install`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For support and questions, please open an issue in the GitHub repository.
