# ------------------------
# Build stage
# ------------------------
FROM golang:1.25.5-alpine AS builder

WORKDIR /app

# Копируем только модульные файлы сначала для кэширования зависимостей
COPY go.mod go.sum ./
RUN go mod download

# Копируем весь проект
COPY . .

# Сборка приложения
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o api ./cmd/api

# ------------------------
# Runtime stage
# ------------------------
FROM gcr.io/distroless/base-debian12

WORKDIR /app

# Копируем собранный бинарник
COPY --from=builder /app/api /app/api

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/app/api"]
