import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  build: {
    manifest: true,
    rollupOptions: {
      input: "./src/main.tsx",
    },
  },
});
