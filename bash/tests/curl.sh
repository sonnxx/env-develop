#!/bin/bash
echo ""
echo "==========================================="
echo "=============== Testing PHP ==============="
echo "==========================================="

echo ""
curl http://example.local
echo ""
curl http://example7.local
echo ""

echo ""
echo "================================================"
echo "=============== Testing Elasticsearch =========="
echo "================================================"

curl 127.0.0.1:9200