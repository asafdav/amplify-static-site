# Static Site for AWS Amplify

This is a simple static site designed to be deployed on AWS Amplify.

## Files

- `index.html` - The main page
- `debug.html` - A debug page that displays information about the environment
- `api/debug.json` - A static JSON file that simulates an API endpoint
- `amplify.yml` - Configuration file for AWS Amplify

## Deployment

This site can be deployed directly to AWS Amplify without any build steps.

## Testing

To test the site locally, you can use any static file server, such as:

```bash
npx serve
```

Or with Python:

```bash
python -m http.server
``` 