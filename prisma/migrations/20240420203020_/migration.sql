/*
  Warnings:

  - Made the column `userId` on table `transcations` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "transcations" DROP CONSTRAINT "transcations_userId_fkey";

-- AlterTable
ALTER TABLE "transcations" ALTER COLUMN "userId" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "transcations" ADD CONSTRAINT "transcations_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
