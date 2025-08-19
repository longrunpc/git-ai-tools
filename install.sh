#!/bin/bash

# 🤖 Git AI Tools 설치 스크립트
# 사용법: curl -fsSL https://raw.githubusercontent.com/longrunpc/git-ai-tools/main/install.sh | bash

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🤖 Git AI Tools 설치를 시작합니다...${NC}"
echo ""

# 운영체제 확인
if [[ "$OSTYPE" != "darwin"* ]] && [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo -e "${RED}❌ 지원되지 않는 운영체제입니다. macOS 또는 Linux가 필요합니다.${NC}"
    exit 1
fi

# 필수 의존성 확인
echo -e "${BLUE}🔍 필수 의존성 확인 중...${NC}"
missing_deps=()

if ! command -v git &> /dev/null; then
    missing_deps+=("git")
fi

if ! command -v curl &> /dev/null; then
    missing_deps+=("curl")
fi

if ! command -v jq &> /dev/null; then
    missing_deps+=("jq")
fi

if ! command -v gh &> /dev/null; then
    missing_deps+=("gh")
fi

if [ ${#missing_deps[@]} -ne 0 ]; then
    echo -e "${RED}❌ 다음 의존성이 설치되어 있지 않습니다: ${missing_deps[*]}${NC}"
    echo ""
    echo "다음 명령어로 설치해주세요:"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo -e "${YELLOW}macOS (Homebrew):${NC}"
        echo "brew install ${missing_deps[*]}"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo -e "${YELLOW}Ubuntu/Debian:${NC}"
        echo "sudo apt update && sudo apt install ${missing_deps[*]}"
        echo -e "${YELLOW}CentOS/RHEL:${NC}"
        echo "sudo yum install ${missing_deps[*]}"
    fi
    echo ""
    echo "설치 후 다시 실행해주세요."
    exit 1
fi

echo -e "${GREEN}✅ 모든 의존성이 설치되어 있습니다.${NC}"

# 설치 디렉토리 생성
INSTALL_DIR="$HOME/.ai-dev-tools"
echo -e "${BLUE}📁 설치 디렉토리 생성: $INSTALL_DIR${NC}"
mkdir -p "$INSTALL_DIR"

# 임시 디렉토리에서 저장소 클론 (로컬에서 실행되는 경우 처리)
if [ -f "$(dirname "$0")/aicommit" ] && [ -f "$(dirname "$0")/aipr" ]; then
    # 로컬에서 실행되는 경우
    echo -e "${BLUE}📦 로컬 파일에서 설치 중...${NC}"
    SCRIPT_DIR="$(dirname "$0")"
    cp "$SCRIPT_DIR/aicommit" "$INSTALL_DIR/"
    cp "$SCRIPT_DIR/aipr" "$INSTALL_DIR/"
    cp "$SCRIPT_DIR/config.sh" "$INSTALL_DIR/"
else
    # GitHub에서 다운로드하는 경우
    echo -e "${BLUE}📦 GitHub에서 다운로드 중...${NC}"
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR"
    
    if ! git clone https://github.com/longrunpc/git-ai-tools.git; then
        echo -e "${RED}❌ 저장소 클론에 실패했습니다.${NC}"
        rm -rf "$TEMP_DIR"
        exit 1
    fi
    
    cd git-ai-tools
    cp aicommit "$INSTALL_DIR/"
    cp aipr "$INSTALL_DIR/"
    cp config.sh "$INSTALL_DIR/"
    
    # 임시 디렉토리 정리
    cd "$HOME"
    rm -rf "$TEMP_DIR"
fi

# 실행 권한 부여
chmod +x "$INSTALL_DIR/aicommit"
chmod +x "$INSTALL_DIR/aipr"

echo -e "${GREEN}✅ 파일 설치 완료${NC}"

# PATH 설정
echo -e "${BLUE}🔧 PATH 설정 중...${NC}"

# 쉘 설정 파일 결정
if [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
else
    # 기본값으로 .bashrc 사용
    SHELL_RC="$HOME/.bashrc"
fi

# PATH 추가 (중복 방지)
PATH_EXPORT="export PATH=\"\$HOME/.ai-dev-tools:\$PATH\""
if ! grep -q "\.ai-dev-tools" "$SHELL_RC" 2>/dev/null; then
    echo "" >> "$SHELL_RC"
    echo "# AI Dev Tools" >> "$SHELL_RC"
    echo "$PATH_EXPORT" >> "$SHELL_RC"
    echo -e "${GREEN}✅ $SHELL_RC에 PATH 추가됨${NC}"
else
    echo -e "${YELLOW}⚠️  PATH가 이미 설정되어 있습니다.${NC}"
fi

# 현재 세션에 PATH 추가
export PATH="$HOME/.ai-dev-tools:$PATH"

echo ""
echo -e "${GREEN}🎉 설치가 완료되었습니다!${NC}"
echo ""
echo -e "${YELLOW}다음 단계:${NC}"
echo -e "${BLUE}1. API 키 설정:${NC}"
echo "   nano ~/.ai-dev-tools/config.sh"
echo "   (YOUR_OPENAI_API_KEY_HERE를 실제 키로 변경)"
echo ""
echo -e "${BLUE}2. 쉘 다시 로드:${NC}"
echo "   source $SHELL_RC"
echo ""
echo -e "${BLUE}3. 명령어 테스트:${NC}"
echo "   aicommit --help"
echo "   aipr --help"
echo ""
echo -e "${BLUE}4. GitHub CLI 로그인 (아직 안 했다면):${NC}"
echo "   gh auth login"
echo ""
echo -e "${GREEN}사용법:${NC}"
echo -e "${BLUE}• 커밋 메시지 생성:${NC} git add . && aicommit"
echo -e "${BLUE}• PR 생성:${NC} aipr"
echo ""
echo -e "${YELLOW}문서: https://github.com/longrunpc/git-ai-tools${NC}" 