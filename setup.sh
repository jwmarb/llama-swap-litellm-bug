LLAMA_SERVER="${LLAMA_SERVER:-$(which llama-server 2> /dev/null)}"
LLAMA_SWAP="${LLAMA_SWAP:-$(which llama-swap 2> /dev/null)}"

if [[ ! -e "SmolLM2-135M-Instruct.i1-Q6_K.gguf" ]]; then
  wget https://huggingface.co/mradermacher/SmolLM2-135M-Instruct-i1-GGUF/resolve/main/SmolLM2-135M-Instruct.i1-Q6_K.gguf
fi

cat > config.yaml << EOF 
models:
  smollm2:
    proxy: 'http://localhost:6000'
    cmd: >
      ${LLAMA_SERVER}
      -m $(pwd)/SmolLM2-135M-Instruct.i1-Q6_K.gguf
      --port 6000
EOF

($LLAMA_SWAP --config $(pwd)/config.yaml) & (docker compose up)