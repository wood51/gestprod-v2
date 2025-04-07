import { defineConfig } from 'vite'
import path from 'path'

export default defineConfig({
  server: {
    host: '0.0.0.0',
    port: 5173,
    watch: {
      usePolling: true,
    },
  },
  plugins: [
    {
      name: 'full-reload-php',
      handleHotUpdate({ file, server }) {
        if (file.endsWith('.php') || file.endsWith('.html')) {
          server.ws.send({
            type: 'full-reload',
            path: '*',
          });
        }
      }
    }
  ],
  build: {
    emptyOutDir: true,
    outDir: 'app/views/assets/css/build',
    rollupOptions: {
      input: path.resolve(__dirname, 'app/views/assets/css/src/entry.js'),
      output: {
        entryFileNames: 'ignored.js',
        assetFileNames: 'output.css'
      }
    }
  }
})
