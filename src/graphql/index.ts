import { ApolloServer } from "@apollo/server";
import { User } from "./user";
import { Transcation } from "./transcation";

async function createApolloGraphqlServer() {
  const gqlServer = new ApolloServer({
    typeDefs: `
            ${User.typeDefs}
            ${Transcation.typeDefs}
            type Query {
               ${User.queries}
               ${Transcation.queries}
            }

            type Mutation {
               ${User.mutations}
               ${Transcation.mutations}
            }
        `,
    resolvers: {
      Query: {
        ...User.resolvers.queries,
        ...Transcation.resolvers.queries
      },
      Mutation: {
        ...User.resolvers.mutations,
        ...Transcation.resolvers.mutations
      },
    }
  })

  // Start the gql server
  await gqlServer.start();

  return gqlServer;
}

export default createApolloGraphqlServer;
