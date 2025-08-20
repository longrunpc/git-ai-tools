# AI 개발 도구에 기여하기

AI 개발 도구에 관심을 가져주셔서 감사합니다! 커뮤니티의 기여를 환영합니다.

## 🤝 기여 방법

### 버그 신고

1. [Issues](https://github.com/longrunpc/ai-dev-tools/issues)에서 이미 신고된 버그인지 확인
2. 새로운 이슈라면 다음 정보와 함께 이슈 생성:
   - 버그에 대한 명확한 설명
   - 재현 단계
   - 예상 동작 vs 실제 동작
   - 시스템 정보 (OS, 쉘 등)

### 기능 제안

1. [Discussions](https://github.com/longrunpc/ai-dev-tools/discussions)에서 기존 요청 확인
2. 새로운 토론이나 이슈 생성 시 다음 포함:
   - 기능에 대한 명확한 설명
   - 사용 사례와 이점
   - 가능한 구현 방법

### 코드 기여

1. **저장소 포크**
   ```bash
   git clone https://github.com/longrunpc/ai-dev-tools.git
   cd ai-dev-tools
   ```

2. **기능 브랜치 생성**
   ```bash
   git checkout -b feat/your-feature-name
   ```

3. **변경사항 적용**
   - 기존 코드 스타일을 따라주세요
   - 복잡한 로직에는 주석 추가
   - 필요시 문서 업데이트

4. **변경사항 테스트**
   ```bash
   # 로컬 설치
   ./install.sh

   # 다양한 프로젝트 타입에서 테스트
   cd ~/test-react-project && aicommit
   cd ~/test-java-project && aicommit
   ```

5. **변경사항 커밋**
   ```bash
   git add .
   aicommit  # 우리 도구를 사용하세요! 😄
   ```

6. **푸시 및 PR 생성**
   ```bash
   git push origin feat/your-feature-name
   ```

## 📋 개발 가이드라인

### 코드 스타일

- 명확하고 설명적인 변수명 사용
- 명확하지 않은 로직에 주석 추가
- 쉘 스크립트 모범 사례 준수
- 오류를 우아하게 처리

### 프로젝트 구조

```
ai-dev-tools/
├── config.sh      # 설정 및 API 키
├── utils.sh        # 유틸리티 함수
├── aicommit        # AI 커밋 메시지 생성기
├── aipr            # AI PR 생성기
├── install.sh      # 설치 스크립트
├── README.md       # 메인 문서
├── LICENSE         # MIT 라이선스
└── CONTRIBUTING.md # 이 파일
```

### 새로운 프로젝트 타입 지원 추가

1. **`utils.sh` 업데이트**:
   ```bash
   # detect_project_type() 함수에 감지 로직 추가
   elif [ -f "your-project-file" ]; then
       project_type="your-type"
       project_context="Your Project Type"
   ```

2. **샘플 프로젝트로 테스트**
3. **문서 업데이트**

### 테스트

PR 제출 전 다음을 테스트해주세요:

1. **다양한 운영체제**: macOS, Linux
2. **다양한 쉘**: bash, zsh
3. **다양한 프로젝트 타입**: React, NestJS, Java, Python 등
4. **엣지 케이스**: 빈 저장소, Git이 아닌 디렉토리 등

## 🚀 릴리스 프로세스

1. 관련 파일의 버전 업데이트
2. CHANGELOG.md 업데이트
3. 릴리스 PR 생성
4. 병합 후 태그 생성
5. GitHub Actions가 나머지 처리

## 📝 행동 강령

모든 상호작용에서 서로를 존중하고 건설적으로 대화해주세요. 우리는 모두 개발을 더 나은 것으로 만들기 위해 여기 있습니다!

## 🎯 기여 아이디어

다음과 같은 기여를 환영합니다:

### 코드 개선
- 새로운 프로젝트 타입 지원 (Flutter, Kotlin, Swift 등)
- 성능 최적화
- 오류 처리 개선
- 코드 품질 향상

### 문서화
- 사용 예시 추가
- 번역 (다른 언어로)
- 튜토리얼 비디오
- FAQ 섹션

### 테스트
- 다양한 환경에서 테스트
- 엣지 케이스 발견 및 수정
- 자동화된 테스트 추가

### UI/UX 개선
- 더 나은 에러 메시지
- 진행 상황 표시
- 색상 및 포맷팅 개선

기여해주셔서 감사합니다! 🎉
