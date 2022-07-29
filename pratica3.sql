CREATE DATABASE "loja_Driven";

CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) UNIQUE NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	"cpf" VARCHAR(11) UNIQUE NOT NULL,
	"email" TEXT UNIQUE NOT NULL,
	"password" TEXT NOT NULL
);

CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"number" VARCHAR(14) UNIQUE NOT NULL,
	"type" TEXT NOT NULL
);

CREATE TABLE "customerAddresses" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER UNIQUE NOT NULL REFERENCES "customers"("id"),
	"street" TEXT NOT NULL,
	"number" INTEGER NOT NULL,
	"complement" TEXT,
	"postalCode" VARCHAR(8) NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE "bankAccount" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"accountNumber" VARCHAR(10) UNIQUE NOT NULL,
	"agency" VARCHAR(4) NOT NULL,
	"openDate" TIMESTAMP NOT NULL DEFAULT NOW(),
	"closeDate" TIMESTAMP
);

CREATE TABLE "transactions" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"amount" INTEGER NOT NULL,
	"type" TEXT NOT NULL,
	"time" TIMESTAMP NOT NULL DEFAULT NOW(),
	"description" TEXT,
	"cancelled" BOOLEAN DEFAULT false
);

CREATE TABLE "creditCards" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"name" TEXT NOT NULL,
	"number" VARCHAR(16) NOT NULL,
	"securityCode" VARCHAR(3) NOT NULL,
	"expirationMonth" VARCHAR(2) NOT NULL,
	"expirationYear" VARCHAR(2) NOT NULL,
	"password" TEXT NOT NULL,
	"limit" INTEGER NOT NULL
);


