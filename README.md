# Static Site for AWS Amplify

This is a simple static site designed to be deployed on AWS Amplify.

## Files

- `index.html` - The main page
- `debug.html` - A debug page that displays information about the environment
- `api/debug.json` - A static JSON file that simulates an API endpoint
- `amplify.yml` - Configuration file for AWS Amplify
- `connect-amplify-github.sh` - Script to help connect GitHub to AWS Amplify

## Deployment

This site can be deployed directly to AWS Amplify without any build steps.

### AWS Amplify Setup

The site has been configured with AWS Amplify with the following settings:

- App ID: `d2tj903phht9yk`
- Default domain: `d2tj903phht9yk.amplifyapp.com`
- Auto branch creation enabled for:
  - `main` branch
  - `feature/*` branches
- Build specification configured to deploy static files without build steps

### Connecting to GitHub

To connect the GitHub repository to AWS Amplify:

1. Run the provided script:
   ```bash
   ./connect-amplify-github.sh
   ```

2. Follow the instructions in the script to connect your GitHub repository to AWS Amplify.

3. After connecting, your site will be available at:
   - Main branch: `https://main.d2tj903phht9yk.amplifyapp.com`
   - Feature branches: `https://feature-branch-name.d2tj903phht9yk.amplifyapp.com`

## Testing

To test the site locally, you can use any static file server, such as:

```bash
npx serve
```

Or with Python:

```bash
python -m http.server
``` 