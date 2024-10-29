/*
  Warnings:

  - The primary key for the `ExpenseByCategory` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `expenseByCategory` on the `ExpenseByCategory` table. All the data in the column will be lost.
  - The primary key for the `Purchases` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `purchasesId` on the `Purchases` table. All the data in the column will be lost.
  - You are about to drop the column `uniCost` on the `Purchases` table. All the data in the column will be lost.
  - The primary key for the `Sales` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `UserId` on the `Users` table. All the data in the column will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `expenseByCategoryId` to the `ExpenseByCategory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `purchaseId` to the `Purchases` table without a default value. This is not possible if the table is not empty.
  - Added the required column `unitCost` to the `Purchases` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `saleId` on the `Sales` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `userId` to the `Users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Sales" DROP CONSTRAINT "Sales_productId_fkey";

-- AlterTable
ALTER TABLE "ExpenseByCategory" DROP CONSTRAINT "ExpenseByCategory_pkey",
DROP COLUMN "expenseByCategory",
ADD COLUMN     "expenseByCategoryId" TEXT NOT NULL,
ADD CONSTRAINT "ExpenseByCategory_pkey" PRIMARY KEY ("expenseByCategoryId");

-- AlterTable
ALTER TABLE "Purchases" DROP CONSTRAINT "Purchases_pkey",
DROP COLUMN "purchasesId",
DROP COLUMN "uniCost",
ADD COLUMN     "purchaseId" TEXT NOT NULL,
ADD COLUMN     "unitCost" DOUBLE PRECISION NOT NULL,
ADD CONSTRAINT "Purchases_pkey" PRIMARY KEY ("purchaseId");

-- AlterTable
ALTER TABLE "Sales" DROP CONSTRAINT "Sales_pkey",
DROP COLUMN "saleId",
ADD COLUMN     "saleId" INTEGER NOT NULL,
ADD CONSTRAINT "Sales_pkey" PRIMARY KEY ("saleId");

-- AlterTable
ALTER TABLE "Users" DROP CONSTRAINT "Users_pkey",
DROP COLUMN "UserId",
ADD COLUMN     "userId" TEXT NOT NULL,
ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("userId");

-- DropTable
DROP TABLE "User";

-- AddForeignKey
ALTER TABLE "Sales" ADD CONSTRAINT "Sales_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("productId") ON DELETE CASCADE ON UPDATE CASCADE;
