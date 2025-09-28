const express = require('express');
const path = require('path');
const helmet = require('helmet');
const compression = require('compression');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3001;

// Security middleware
app.use(helmet({
  contentSecurityPolicy: {
    directives: {
      defaultSrc: ["'self'"],
      styleSrc: ["'self'", "'unsafe-inline'"],
      scriptSrc: ["'self'", "'unsafe-inline'"],
      imgSrc: ["'self'", "data:", "https:"],
      connectSrc: ["'self'"],
      fontSrc: ["'self'"],
      objectSrc: ["'none'"],
      mediaSrc: ["'self'"],
      frameSrc: ["'none'"],
    },
  },
  crossOriginEmbedderPolicy: false
}));

// Performance middleware
app.use(compression());
app.use(cors());

// Parse JSON bodies
app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true, limit: '10mb' }));

// Serve static files from public directory
app.use(express.static(path.join(__dirname, 'public'), {
  maxAge: '1d',
  etag: true
}));

// Landing page route
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// About page route
app.get('/about', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'about.html'));
});

// Whitepaper page route
app.get('/whitepaper', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'whitepaper.html'));
});

// Health check endpoint
app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    version: '1.0.0'
  });
});

// API routes placeholder
app.get('/api/status', (req, res) => {
  res.json({
    message: 'EchoLoop API is running',
    version: '1.0.0',
    timestamp: new Date().toISOString()
  });
});

// Catch-all handler: send back index.html for client-side routing
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error('Error:', err.stack);
  res.status(500).json({
    error: 'Something went wrong!',
    message: process.env.NODE_ENV === 'production' ? 'Internal server error' : err.message
  });
});

// Start server
app.listen(PORT, '0.0.0.0', () => {
  console.log(`🚀 EchoLoop server running on port ${PORT}`);
  console.log(`🌍 Environment: ${process.env.NODE_ENV || 'development'}`);
  console.log(`📍 Access at: http://localhost:${PORT}`);
});

module.exports = app;