import { prismaClient } from "../lib/db";

export interface CreateTransactionsPayload {
  moneyType: string;
  roles: string;
  authorId: string;
  amount: number;
  friend: string;
  remarks: string;
}

class TransactionService {
  public static async createTransaction(payload: CreateTransactionsPayload) {
    const { amount, friend, moneyType, remarks, roles, authorId } = payload;
    return await prismaClient.transcations.create({
      data: {
        User: {
          connect: {
            id: authorId,
          },
        },
        amount: amount,
        friend: friend,
        moneyType: moneyType,
        remarks: remarks,
        roles: roles,
      },
    });
  }
  public static async getAllTranscation(id: string) {
    const result = await prismaClient.transcations.findMany({
      where: {
        userId: id,
      },
    });
    return result;
  }
}

export default TransactionService;
