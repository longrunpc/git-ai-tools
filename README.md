# 🤖 Git AI Tools

**AI가 만들어주는 Git 커밋 메시지와 PR 자동화**

AI를 사용하여 의미있는 커밋 메시지와 풀 리퀘스트 설명을 자동으로 생성합니다. 여러 프로그래밍 언어와 프로젝트 타입을 지능적으로 감지하여 맞춤형 메시지를 제공합니다. 이 프로젝트는 claude-4-sonnet을 사용하여 제작했습니다.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![macOS](https://img.shields.io/badge/macOS-지원-brightgreen.svg)](https://www.apple.com/macos/)
[![Linux](https://img.shields.io/badge/Linux-지원-brightgreen.svg)](https://www.linux.org/)

## ✨ 주요 기능

- 🧠 **스마트 프로젝트 감지** - 프로젝트 타입 자동 인식 (React, NestJS, Java, Python 등)
- 📝 **AI 기반 메시지 생성** - 의미있는 커밋 메시지와 PR 설명 자동 생성
- 🌍 **글로벌 명령어** - 모든 Git 저장소에서 `aicommit`, `aipr` 사용 가능
- 🔗 **이슈 자동 연결** - 브랜치명에서 이슈 번호를 추출하여 PR과 자동 연결
- 🎯 **표준 커밋 형식** - Conventional Commits 형식 준수
- 🔒 **보안** - API 키는 로컬에만 저장, 절대 공유되지 않음

## 🚀 설치 가이드

### 1단계: 필수 의존성 설치

설치하기 전에 다음 프로그램들이 필요합니다:

**macOS (Homebrew 사용):**
```bash
# Homebrew가 없다면 먼저 설치
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 필수 도구들 설치
brew install git curl jq gh
```

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install git curl jq

# GitHub CLI 설치
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
```

**CentOS/RHEL:**
```bash
sudo yum install git curl jq

# GitHub CLI 설치
sudo dnf install 'dnf-command(config-manager)'
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh
```

### 2단계: Git AI Tools 다운로드 및 설치

1. **저장소 클론:**
   ```bash
   git clone https://github.com/longrunpc/git-ai-tools.git
   cd git-ai-tools
   ```

2. **설치 스크립트 실행:**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

   설치 스크립트가 자동으로 다음 작업을 수행합니다:
   - 의존성 검증
   - `~/.ai-dev-tools` 디렉토리에 도구 설치
   - 쉘 PATH 환경변수 자동 설정

### 3단계: API 키 설정

#### OpenAI API 키 설정 (권장)

1. **OpenAI 계정 생성 및 API 키 발급:**
   - [OpenAI Platform](https://platform.openai.com/api-keys) 접속
   - 계정 생성 또는 로그인
   - "Create new secret key" 클릭하여 API 키 생성
   - 생성된 키를 안전한 곳에 복사

2. **설정 파일 편집:**
   ```bash
   nano ~/.ai-dev-tools/config.sh
   ```

3. **API 키 입력:**
   ```bash
   # 이 부분을 찾아서
   export OPENAI_API_KEY="YOUR_OPENAI_API_KEY_HERE"
   
   # 실제 키로 변경 (예시)
   export OPENAI_API_KEY="sk-proj-abcd1234..."
   ```

#### Anthropic Claude API 키 설정 (대안)

OpenAI 대신 Anthropic Claude를 사용하려면:

1. **Anthropic 계정 생성:**
   - [Anthropic Console](https://console.anthropic.com/) 접속
   - API 키 생성

2. **설정 파일에서 Claude 활성화:**
   ```bash
   export OPENAI_API_KEY=""  # OpenAI 비활성화
   export ANTHROPIC_API_KEY="sk-ant-your-key-here"
   ```

### 4단계: GitHub CLI 설정

```bash
# GitHub에 로그인
gh auth login

# 웹 브라우저를 통한 인증 선택
# 또는 토큰을 직접 입력
```

### 5단계: 설치 확인

1. **새 터미널 열기 또는 쉘 다시 로드:**
   ```bash
   source ~/.zshrc  # zsh 사용자
   # 또는
   source ~/.bashrc  # bash 사용자
   ```

2. **명령어 테스트:**
   ```bash
   # 명령어가 인식되는지 확인
   which aicommit aipr
   
   # 도움말 확인
   aicommit --help
   aipr --help
   ```

3. **API 연결 테스트:**
   ```bash
   # 테스트용 변경사항 생성
   echo "# 테스트" > test.txt
   git add test.txt
   
   # AI 커밋 메시지 생성 테스트
   aicommit
   
   # 테스트 파일 정리
   git reset HEAD test.txt
   rm test.txt
   ```

## �� 사용법

### AI 커밋 메시지 생성

```bash
# 변경사항 stage
git add .

# AI 커밋 메시지 생성
aicommit
```

**예시 출력:**
```
📋 감지된 프로젝트: React 프로젝트

✨ AI가 생성한 커밋 메시지:
feat(components): 반응형 네비게이션 컴포넌트 추가

- 모바일 친화적 네비게이션 바 구현
- 모바일 기기용 햄버거 메뉴 추가
- 접근성 기능 및 ARIA 라벨 포함
```

### AI 풀 리퀘스트 생성

```bash
# 기능 브랜치 생성
git checkout -b feat/#123-user-auth

# 변경사항 적용 및 커밋
git add .
aicommit

# AI PR 생성 (대화형 브랜치 선택)
aipr

# 또는 대상 브랜치 직접 지정
aipr --target main
aipr -t develop
```

**예시 출력:**
```
🎯 PR을 보낼 대상 브랜치를 선택해주세요:

사용 가능한 브랜치:
  1. main (기본)
  2. develop
  0. 직접 입력

선택 (1-2 또는 0, 엔터키=기본값): 1
✅ 대상 브랜치: main

📋 감지된 프로젝트: NestJS 프로젝트
🌿 현재 브랜치: feat/#123-user-auth

✨ AI가 생성한 PR 정보:
제목: feat: 사용자 인증 시스템 구현

## #️⃣연관된 이슈
resolves: #123

## 📝작업 내용
- JWT 인증 미들웨어 추가
- 사용자 로그인/로그아웃 엔드포인트 구현
- 패스워드 해싱 유틸리티 생성
- 보호된 라우트용 인증 가드 추가
```

## 🎯 지원하는 프로젝트 타입

AI가 자동으로 프로젝트 타입을 감지하여 맥락에 맞는 메시지를 생성합니다:

| 프로젝트 타입 | 감지 방법 | 예시 기술 |
|-------------|-----------|----------|
| **React** | `package.json`에 "react" 포함 | Create React App, Next.js, Vite |
| **Vue.js** | `package.json`에 "vue" 포함 | Vue CLI, Nuxt.js, Vite |
| **NestJS** | `package.json`에 "nest" 포함 | NestJS 프레임워크 |
| **Express** | `package.json`에 "express" 포함 | Express.js, Koa.js |
| **Node.js** | `package.json` 존재 | 모든 Node.js 프로젝트 |
| **Java** | `pom.xml` 또는 `build.gradle` | Spring Boot, Maven, Gradle |
| **Python** | `requirements.txt` 또는 `pyproject.toml` | Django, Flask, FastAPI |
| **Rust** | `Cargo.toml` | Cargo 프로젝트 |
| **Go** | `go.mod` | Go 모듈 |
| **C#** | `*.csproj` 파일 | .NET Core, .NET Framework |
| **일반** | 모든 Git 저장소 | 범용 지원 |

## ⚡ 고급 기능

### PR 대상 브랜치 선택

`aipr` 명령어는 유연한 브랜치 선택 기능을 제공합니다:

#### 1. 대화형 선택 (기본)
```bash
aipr
# 사용 가능한 브랜치 목록에서 선택하거나 직접 입력
```

#### 2. 명령줄에서 직접 지정
```bash
aipr --target main      # main 브랜치로 PR
aipr -t develop        # develop 브랜치로 PR (단축형)
aipr --target release/v1.2.0  # 특정 릴리즈 브랜치로 PR
```

#### 3. 자동 감지되는 브랜치들
- `main` (기본값)
- `master`
- `dev`
- `develop`

### 브랜치 명명 규칙

최적의 PR 생성을 위해 다음 브랜치 명명 패턴을 사용하세요:

```bash
<타입>/#<이슈번호>-<설명>

# 예시:
feat/#123-user-authentication    # 새 기능 (이슈 #123)
fix/#456-login-bug              # 버그 수정 (이슈 #456)
chore/#789-update-deps          # 유지보수 (이슈 #789)
docs/#100-api-documentation     # 문서 작업 (이슈 #100)
```

### 사용자 설정

`~/.ai-dev-tools/config.sh`를 편집하여 설정을 변경할 수 있습니다:

```bash
# AI 모델 설정
export AI_MODEL="gpt-4"              # 더 높은 품질을 위해 GPT-4 사용
export MAX_TOKENS=1000              # 더 긴 응답
export TEMPERATURE=0.2              # 더 일관된 결과

# Anthropic Claude 사용
export ANTHROPIC_API_KEY="your-claude-key"
export OPENAI_API_KEY=""            # OpenAI 비활성화
```

## 📋 요구사항

- **운영체제:** macOS 또는 Linux
- **쉘:** Bash 또는 Zsh
- **의존성:**
  - `git` (버전 관리용)
  - `curl` (설치용)
  - `jq` (JSON 처리용)
  - `gh` (GitHub CLI, PR 생성용)

### 의존성 설치

**macOS:**
```bash
brew install git curl jq gh
```

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install git curl jq gh
```

**CentOS/RHEL:**
```bash
sudo yum install git curl jq gh
```

## 🔧 API 키 설정

### OpenAI API 키

1. [OpenAI Platform](https://platform.openai.com/api-keys) 방문
2. 새 API 키 생성
3. 설정에 추가:
   ```bash
   export OPENAI_API_KEY="sk-proj-your-key-here"
   ```

### Anthropic API 키 (대안)

1. [Anthropic Console](https://console.anthropic.com/) 방문
2. 새 API 키 생성
3. 설정에 추가:
   ```bash
   export ANTHROPIC_API_KEY="sk-ant-your-key-here"
   export OPENAI_API_KEY=""  # OpenAI 비활성화
   ```

## 🛠️ 문제 해결

### 명령어를 찾을 수 없음

```bash
# PATH에 도구가 있는지 확인
echo $PATH | grep ai-dev-tools

# 수동으로 PATH에 추가
export PATH="$HOME/.ai-dev-tools:$PATH"
source ~/.zshrc
```

### API 키 문제

```bash
# API 키 설정 확인
cat ~/.ai-dev-tools/config.sh

# API 키 테스트
curl -H "Authorization: Bearer your-api-key" \
     https://api.openai.com/v1/models
```

### GitHub CLI 설정

```bash
# GitHub CLI 설치
brew install gh  # macOS
sudo apt install gh  # Ubuntu

# GitHub 로그인
gh auth login
```

## 🤝 기여하기

기여를 환영합니다! 자세한 내용은 [기여 가이드](CONTRIBUTING.md)를 참조하세요.

1. 저장소 포크
2. 기능 브랜치 생성: `git checkout -b feat/amazing-feature`
3. 변경사항 커밋: `git commit -m 'feat: 놀라운 기능 추가'`
4. 브랜치에 푸시: `git push origin feat/amazing-feature`
5. 풀 리퀘스트 열기

## 📝 라이선스

이 프로젝트는 MIT 라이선스 하에 있습니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하세요.

---
