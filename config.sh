#!/bin/bash

# 🤖 AI 개발 도구 글로벌 설정
# ~/.ai-dev-tools/config.sh

# =====================================
# API 키 설정 (여기에 실제 키를 입력하세요)
# =====================================

# OpenAI API 키
export OPENAI_API_KEY="YOUR_OPENAI_API_KEY_HERE"

# Anthropic (Claude) API 키 (선택사항)
export ANTHROPIC_API_KEY=""

# =====================================
# 일반 설정
# =====================================

# 기본 모델 설정
export AI_MODEL="gpt-4o-mini"
export MAX_TOKENS=800
export TEMPERATURE=0.3

# 색상 설정
export AI_GREEN='\033[0;32m'
export AI_BLUE='\033[0;34m'
export AI_YELLOW='\033[1;33m'
export AI_RED='\033[0;31m'
export AI_NC='\033[0m'
