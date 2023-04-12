apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-web-php

spec:
  replicas: 2
  selector:
    matchLabels:
      project: php-app
  template:
    metadata:
      labels:
        project: php-app # Service will look for those PODS Labels
    spec:
      containers:
        - name: php-web
          image: 097084951758.dkr.ecr.us-east-1.amazonaws.com/web:latest
          ports:
            - containerPort: 80