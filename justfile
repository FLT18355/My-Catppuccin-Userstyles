default:
    @just --list

list:
    @ls -la styles/*.json 2>/dev/null || echo "未找到主题文件"

validate:
    @cat styles/userstylus.json | jq . > /dev/null 2>&1 && echo "✅ JSON 格式正确" || echo "❌ JSON 格式错误"

zip:
    mkdir -p dist
    cp -r styles/ dist/
    cp README.md LICENSE dist/ 2>/dev/null || true
    zip -r catppuccin-userstyles.zip dist/
    @echo "✅ 已打包为 catppuccin-userstyles.zip"

clean:
    rm -rf dist/
    rm -f *.zip
    @echo "🧹 已清理"

push:
    git add .
    git commit -m "更新主题" || echo "没有需要提交的更改"
    git push

status:
    git status