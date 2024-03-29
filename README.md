# 연세 철도 주식회사

# 📂목차

- [🗽 프로젝트 소개](#-프로젝트-소개)
- [🔨 기술 스택](#기술-스택)
- [🏅 프로젝트 개발 기능](#-프로젝트-개발-기능)


# 🗽 프로젝트 소개


### 👉 프로젝트 내용

- 연세대학교 데이터베이스 프로젝트 주제로 '연세철도주식회사'의 데이터를 효율적으로 관리하는 DB 시스템을 개발합니다. 이 시스템은 연세철도주식회사의 철도 노선, 열차, 운행 상황 등을 효율적으로 관리할 수 있는 데이터베이스를 구축하며, MySQL과 MariaDB를 활용하여 구현합니다. 또한, JSP와 자바스크립트를 활용하여 웹 인터페이스를 개발하여 사용자가 데이터를 조회하고 수정할 수 있도록 합니다.


# 🔨 기술 스택

![image](https://github.com/mgskko/bike_data/assets/100071667/345bf7e2-ce53-4a74-86fc-b6651b21f0df)


# 🏅 프로젝트 개발 기능

## 로그인 기능

- User 테이블 관리 (ID/Password 등) 및 Session 관리
- Password 암호화하여 저장 (optional)

## 입력 기능

- 모든 테이블(operation 테이블 제외)에 대한 입력(insert) 기능
- 입력 오류 체크 및 foreign key constraint 적용
- 입력 시 편의 기능 제공 (예: station 입력 시 선택 가능한 headquarter 목록 보여주기)

## 검색 기능

- 모든 테이블(operation 테이블 제외)에 대한 검색(select) 기능
- 각 테이블들에 대한 검색 기능 제공 (다양한 검색 조건 적용)
- 검색 결과 리스트(표) 표출
- 검색 결과 클릭 시 상세보기 화면으로 이동
- 검색 조건 입력 시 편의 기능 제공

## 수정/삭제 기능

- 모든 테이블(operation 테이블 제외)에 대한 수정/삭제(update/delete) 기능
- 검색 기능과 연계하여 상세보기 화면에서 수정/삭제 기능 연계
- 수정 시 이미 입력되어 있는 내용을 기반으로 값을 수정할 수 있도록 기능 제공 (constraint 유지)

## ER 다이어그램

![image](https://github.com/mgskko/bike_data/assets/100071667/6116942d-cce6-4b7f-8c87-5486620923ec)




