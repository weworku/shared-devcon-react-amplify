# shared-devcon-react-amplify-devcontainer の使い方

## 🧭 このワーク用 devcontainer について

- **Debian ベースの Node.js コンテナ**
- `react` を使ったフロントエンド開発を想定
- 開発効率を上げるため、以下のツールがプリインストールされています：
  - `git`（バージョン管理）
  - `Amplify CLI`（AWS クラウド連携用）

Amplify を用いて、

- ユーザー認証（Cognito）
- ストレージ連携（S3）
- サーバーレス API（Lambda, API Gateway）
- ホスティング（静的 or SSR）

などを CLI から簡単に追加・管理できる構成を目指しています。

---

## 🚀 プロジェクトの始め方（React + Vite）

1. **この devcontainer に VS Code で接続**
2. 接続直後の作業ディレクトリは `/usr/src/app`
3. 作業用のプロジェクトフォルダを作成し、以下のようにプロジェクトを作成またはクローンしてください。

### 🔧 新規プロジェクトを作る場合

```bash
npm create vite@latest {プロジェクト名} -- --template react-ts
cd {プロジェクト名}
npm install
```

Vite 公式ガイド: https://ja.vitejs.dev/guide/

### 📦 既存リポジトリを使う場合

```bash
git clone https://github.com/your-org/your-repo.git {プロジェクト名}
cd {プロジェクト名}
npm install
```

---

## ☁️ Amplify CLI の使い方（初回セットアップ）

この devcontainer では `Amplify CLI` がグローバルにインストールされています。

```bash
amplify -v # バージョン確認
```

### ✅ 初期化

```bash
amplify init
```

- プロジェクト名や環境名を聞かれます（通常はそのままで OK）
- CLI が自動で AWS リソースのベース構成を作成します

参考：Amplify 公式 Getting Started  
https://docs.amplify.aws/start/

---

## 📌 よく使う Amplify CLI コマンド

| 目的                           | コマンド                    |
| ------------------------------ | --------------------------- |
| 認証機能の追加（Cognito）      | `amplify add auth`          |
| ファイルストレージの追加（S3） | `amplify add storage`       |
| Lambda 関数の追加              | `amplify add function`      |
| REST または GraphQL API の追加 | `amplify add api`           |
| デプロイ                       | `amplify push`              |
| 状態確認                       | `amplify status`            |
| 変更の取り消し                 | `amplify remove [category]` |

---

## 🪪 AWS 認証について（~/.aws/credentials）

ホスト PC の `~/.aws` をコンテナにマウントすることで、既存の AWS 認証情報を利用できます。  
これにより、Amplify CLI を使っても AWS のアクセス権限を再設定する必要がありません。

※Windows の場合はパスの記述に注意が必要です。

---

## 📝 その他メモ

- VS Code 拡張 `AWS Amplify` を入れると、GUI 操作も可能になります
- 将来的に `amplify pull` を使って他環境への複製も可能です

---
