#!/usr/bin/env bash
echo "=== Ap6 – REST API test ==="
echo ""

echo "[1] Health check (GET)"
curl http://localhost:5002/api/health
echo ""
echo ""

echo "[2] Time Info (GET)"
curl http://localhost:5002/api/time
echo ""
echo ""

echo "[3] Send message (POST)"
curl -X POST -d "message=Hallo" http://localhost:5002/api/message
echo ""
echo ""
echo "=== Test finished ==="