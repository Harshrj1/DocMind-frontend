# DocMind Frontend Application

A modern, responsive React 19 + TypeScript + Tailwind CSS v4 single-page application (SPA) for the DocMind AI document intelligence and RAG platform.

---

## Features

- **Document Management**: Drag-and-drop file uploader with upload progress, supporting PDF, TXT, and DOCX documents.
- **RAG Chat Interface**: Real-time conversational interface with streaming AI responses, Markdown rendering, syntax-highlighted code blocks, and source citations.
- **Chunk Explorer**: Inspect document chunks, metadata, and vector similarity scores.
- **Authentication**: JWT-based login and registration flows with Zustand persistent state management.
- **Responsive & Modern UI**: Sleek dark/light theme designed with Lucide icons, Framer Motion animations, and Tailwind CSS v4.

---

## Tech Stack

- **Framework**: React 19 + TypeScript
- **Build Tool**: Vite 8
- **Styling**: Tailwind CSS v4
- **State Management**: Zustand
- **Routing**: React Router v7
- **HTTP Client**: Axios & Fetch API
- **Icons & Animation**: Lucide React & Framer Motion
- **Markdown & Code Highlighting**: React Markdown, Remark GFM, PrismJS

---

## Directory Structure

```
frontend/
├── public/                       # Static public assets (icons, favicon)
├── src/
│   ├── assets/                   # Images and SVGs
│   ├── components/               # ChatView, ChatsPanel, ChunksView, Navbar, Sidebar, etc.
│   ├── pages/                    # Login, Register pages
│   ├── services/                 # api.ts, authApi.ts, conversationApi.ts
│   ├── store/                    # authStore.ts, conversationStore.ts, documentStore.ts
│   ├── types/                    # TypeScript interfaces and API schemas
│   ├── App.tsx                   # Main application router
│   ├── index.css                 # Global styles and Tailwind imports
│   └── main.tsx                  # React DOM entry point
├── .dockerignore                 # Docker build exclusions
├── .env.example                  # Environment configuration template
├── .gitattributes                # Line ending normalizations
├── .gitignore                    # Git ignore rules for Node/React
├── Dockerfile                    # Multi-stage production Nginx container
├── nginx.conf                    # Nginx SPA fallback routing configuration
├── package.json                  # Dependencies and scripts
├── package-lock.json             # Locked dependency versions
├── tsconfig.json                 # TypeScript compiler configuration
├── vercel.json                   # Vercel SPA routing rewrite rules
├── vite.config.ts                # Vite dev server and proxy configuration
└── README.md                     # Frontend documentation
```

---

## Getting Started (Local Development)

### 1. Install Dependencies
```bash
npm install
```

### 2. Configure Environment Variables
Copy `.env.example` to `.env.local`:
```bash
cp .env.example .env.local
```

- **For local development against local backend (`http://localhost:8080`)**:
  Leave `VITE_API_BASE_URL` empty. The Vite dev server will automatically proxy all `/api/*` requests to `http://localhost:8080`.
- **For pointing to a deployed remote backend**:
  ```env
  VITE_API_BASE_URL=https://your-backend-api.onrender.com
  ```

### 3. Start Development Server
```bash
npm run dev
```
Open [http://localhost:5173](http://localhost:5173) in your browser.

### 4. Build for Production
```bash
npm run build
```
Generates production-ready, minified static assets in `dist/`.

---

## Production Deployments

### 1. Deploying to Vercel (Recommended)

1. Connect your frontend GitHub repository to **Vercel**.
2. **Framework Preset**: Vite
3. **Environment Variables**:
   - `VITE_API_BASE_URL`: `https://your-backend-service.onrender.com`
4. Deploy. The included `vercel.json` automatically handles client-side routing for `/login`, `/register`, etc.

### 2. Deploying to Netlify

1. Connect your frontend GitHub repository to **Netlify**.
2. **Build command**: `npm run build`
3. **Publish directory**: `dist`
4. Add environment variable:
   - `VITE_API_BASE_URL`: `https://your-backend-service.onrender.com`
5. Deploy.

### 3. Docker Deployment (Self-Hosted / Cloud Run / VPS)

Build and run using the included multi-stage Nginx container:

```bash
docker build --build-arg VITE_API_BASE_URL=https://your-backend-service.onrender.com -t docmind-frontend .
docker run -p 80:80 docmind-frontend
```
Access the application on port `80`.

---

## Scripts Reference

- `npm run dev`: Start local development server with HMR
- `npm run build`: Compile TypeScript and build production bundle
- `npm run lint`: Lint source files using Oxlint
- `npm run preview`: Preview the production build locally
