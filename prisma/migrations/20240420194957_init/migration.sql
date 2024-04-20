/*
  Warnings:

  - The primary key for the `Transcations` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `authorId` to the `Transcations` table without a default value. This is not possible if the table is not empty.
  - Made the column `friend` on table `Transcations` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Transcations" DROP CONSTRAINT "Transcations_pkey",
ADD COLUMN     "authorId" TEXT NOT NULL,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "friend" SET NOT NULL,
ADD CONSTRAINT "Transcations_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Transcations_id_seq";

-- AddForeignKey
ALTER TABLE "Transcations" ADD CONSTRAINT "Transcations_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
