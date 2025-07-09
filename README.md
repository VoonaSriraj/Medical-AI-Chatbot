# Medical AI Chatbot

A Flask-based medical chatbot application that uses Retrieval-Augmented Generation (RAG) to provide accurate medical information by combining a large language model with a vector database of medical documents.

## Features

- **RAG Architecture**: Combines retrieval from medical documents with generative AI for accurate responses
- **Vector Search**: Uses Pinecone vector database for efficient similarity search
- **Modern UI**: Clean, responsive chat interface with real-time messaging
- **Document Processing**: Automated PDF processing and text chunking for knowledge base creation
- **Scalable**: Built with Flask for easy deployment and scaling

## Technology Stack

- **Backend**: Flask, Python
- **LLM**: Groq (Llama 3.1 8B Instant)
- **Vector Database**: Pinecone
- **Embeddings**: Sentence Transformers (all-MiniLM-L6-v2)
- **Document Processing**: LangChain, PyPDF
- **Frontend**: HTML, CSS, JavaScript, Bootstrap

## Prerequisites

- Python 3.8+
- Pinecone account and API key
- Groq API key
- Medical PDF documents for knowledge base

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/medical-ai-chatbot.git
cd medical-ai-chatbot
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Set up environment variables:
Create a `.env` file in the root directory:
```
PINECONE_API_KEY=your_pinecone_api_key_here
GROQ_API_KEY=your_groq_api_key_here
```

4. Prepare your medical documents:
   - Place PDF files in the `data/` directory
   - These will be processed and stored in the vector database

## Setup and Configuration

### 1. Initialize the Vector Database

Run the indexing script to process your medical documents and create the Pinecone index:

```bash
python store_index.py
```

This script will:
- Load PDF documents from the `data/` directory
- Split documents into chunks
- Generate embeddings using Sentence Transformers
- Store embeddings in Pinecone vector database

### 2. Configure the Application

The application uses the following default configurations:
- **Index Name**: `medical-bot`
- **Embedding Model**: `sentence-transformers/all-MiniLM-L6-v2`
- **Chunk Size**: 500 characters
- **Search Results**: Top 3 similar documents
- **Vector Dimensions**: 384

## Usage

### Running the Application

Start the Flask development server:

```bash
python app.py
```

The application will be available at `http://localhost:8080`

### Using the Chatbot

1. Open your web browser and navigate to `http://localhost:8080`
2. Type your medical questions in the chat interface
3. The chatbot will search through the medical knowledge base and provide relevant answers
4. Responses are limited to 3 sentences for conciseness

## Project Structure

```
medical-ai-chatbot/
├── app.py                 # Main Flask application
├── main.py               # Entry point
├── store_index.py        # Vector database setup script
├── template.py           # Project structure generator
├── requirements.txt      # Python dependencies
├── .env                  # Environment variables (create this)
├── data/                 # Medical PDF documents directory
├── src/
│   ├── __init__.py
│   ├── helper.py         # Document processing utilities
│   └── prompt.py         # System prompt configuration
├── templates/
│   └── chat.html         # Chat interface template
└── static/
    └── style.css         # CSS styles
```

## API Endpoints

- `GET /` - Serves the chat interface
- `POST /get` - Processes chat messages and returns bot responses

## Key Components

### Document Processing (`src/helper.py`)
- **PDF Loading**: Extracts text from PDF documents
- **Text Splitting**: Chunks documents for optimal retrieval
- **Embedding Generation**: Creates vector representations using Sentence Transformers

### RAG Pipeline (`app.py`)
- **Retrieval**: Searches Pinecone for relevant document chunks
- **Generation**: Uses Groq's Llama model to generate responses
- **Context Integration**: Combines retrieved context with user queries

### Chat Interface (`templates/chat.html`)
- **Real-time Messaging**: AJAX-powered chat interface
- **Responsive Design**: Bootstrap-based UI that works on all devices
- **Message History**: Displays conversation history during the session

## Configuration Options

### Embedding Model
To change the embedding model, modify the `download_hugging_face_embeddings()` function in `src/helper.py`:

```python
embeddings = HuggingFaceEmbeddings(model_name='your-preferred-model')
```

### LLM Model
To change the language model, modify the `chatModel` initialization in `app.py`:

```python
chatModel = ChatGroq(model="your-preferred-model")
```

### Search Parameters
Adjust retrieval settings in `app.py`:

```python
retriever = docsearch.as_retriever(
    search_type="similarity", 
    search_kwargs={"k": 5}  # Number of documents to retrieve
)
```

## Deployment

### Local Development
```bash
python app.py
```

### Production Deployment
For production deployment, consider:
- Using a WSGI server like Gunicorn
- Setting up environment variables securely
- Implementing proper logging and monitoring
- Using a reverse proxy like Nginx

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Disclaimer

This chatbot is for informational purposes only and should not be used as a substitute for professional medical advice, diagnosis, or treatment. Always consult with a qualified healthcare provider for medical concerns.

## Support

For questions or issues, please open an issue on the GitHub repository or contact the maintainers.

## Acknowledgments

- Built with LangChain for RAG implementation
- Uses Pinecone for vector storage and retrieval
- Powered by Groq's language models
- UI components from Bootstrap and Font Awesome
