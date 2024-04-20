/*
  Warnings:

  - You are about to drop the `Transcations` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Transcations" DROP CONSTRAINT "Transcations_userId_fkey";

-- DropTable
DROP TABLE "Transcations";

-- CreateTable
CREATE TABLE "transcations" (
    "id" TEXT NOT NULL,
    "moneyType" TEXT NOT NULL,
    "roles" TEXT NOT NULL,
    "friend" TEXT NOT NULL,
    "remarks" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "userId" TEXT,

    CONSTRAINT "transcations_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "transcations" ADD CONSTRAINT "transcations_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;
