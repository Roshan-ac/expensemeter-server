import TransactionService, {
  CreateTransactionsPayload,
} from "../../services/transaction";

const queries = {
  getTranscations: async (_: any, parameters: any, context: any) => {
    if (context && context.user) {
      const id = context.user.id;
      const res = await TransactionService.getAllTranscation(id);
      return res;
    }
    throw new Error("I dont know who are you");
  },
};

const mutations = {
  createTranscation: async (_: any, payload: CreateTransactionsPayload) => {
    const res = await TransactionService.createTransaction(payload);
    return res.id;
  },
};

export const resolvers = { queries, mutations };
