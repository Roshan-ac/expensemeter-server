-- DropForeignKey
ALTER TABLE "Transcations" DROP CONSTRAINT "Transcations_authorId_fkey";

-- AlterTable
ALTER TABLE "Transcations" ADD COLUMN     "userId" TEXT;

-- AddForeignKey
ALTER TABLE "Transcations" ADD CONSTRAINT "Transcations_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;
