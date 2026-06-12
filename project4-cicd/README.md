# Project 4 - CI/CD Pipeline

## What I built

GitHub Actions workflow that deploys to Azure App Service automatically on every push to main. Push code, robot deploys it. That's it.

## Screenshots

### Live app
![Live App](./screenshots/live-app.png)

### GitHub Actions runs
![GitHub Actions](./screenshots/github-actions.png)

## What took the longest

Getting the deployment to actually serve the right files. The whole repo was being deployed instead of just the project4-cicd folder. Then App Service wasn't picking up server.js as the startup file. Had to set it manually with az webapp config set --startup-file.

## AWS equivalent

- App Service = AWS Elastic Beanstalk
- GitHub Actions = AWS CodePipeline + CodeBuild

## How to deploy

```bash
terraform init
terraform plan
terraform apply
```

Then add AZURE_WEBAPP_PUBLISH_PROFILE to GitHub Secrets before pushing.

## Author
Tanupriya Dehariya
