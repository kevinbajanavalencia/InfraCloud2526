#!/usr/bin/env bash

echo "=== Ap6 – REST API test ==="
echo ""

echo "[1] Health check (GET)"
curl http://localhost:5002/api/health
echo ""
echo ""

echo "[2] Send form data (POST)"
curl -X POST \
     -d "naam=Kevin" \
     -d "bericht=Hallo van curl" \
     http://localhost:5002/api/form
echo ""
echo ""

echo "=== Test finished ==="
