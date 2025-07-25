FROM python:3.9
WORKDIR /app
COPY requirements.txt .

# Update pip first
RUN pip install --upgrade pip

# Install langchain packages first
RUN pip install langchain==0.3.26 langchain-community==0.3.26 langchain-pinecone==0.2.8

# Then install groq (will get compatible version)
RUN pip install langchain-groq

# Install remaining packages
RUN pip install flask==3.1.1 sentence-transformers==4.1.0 pypdf==5.6.1 python-dotenv==1.1.0

# Install local package
COPY . /app

CMD ["python3", "app.py"]