How to run:

```sh
export LLAMA_SERVER=/path/to/llama-server
export LLAMA_SWAP=/path/to/llama-swap
chmod a+x ./setup.sh && ./setup.sh
```

This will download SmolLM2 135M and simultaneously run llama-swap and litellm at the same time

LiteLLM server starts at http://localhost:4000

Llama-swap server starts at http://localhost:8080
