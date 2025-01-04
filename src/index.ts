import { readFileSync } from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// Load Norman's character configuration
const normanConfig = JSON.parse(
  readFileSync(path.join(__dirname, '../characters/norman.character.json'), 'utf-8')
);

export { normanConfig };

// Main entry point
async function main() {
  console.log('Norman AI is starting...');
  // Add your initialization code here
}

if (import.meta.url === `file://${process.argv[1]}`) {
  main().catch(console.error);
}
