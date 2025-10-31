// USERS
CREATE (u1:User {name: "Alice", verified: true, followers: 12000})
CREATE (u2:User {name: "Bruno", verified: false, followers: 540})
CREATE (u3:User {name: "Carla", verified: true, followers: 8000})

// HASHTAGS
CREATE (h1:Hashtag {tag: "#Elections2025"})
CREATE (h2:Hashtag {tag: "#Economy"})
CREATE (h3:Hashtag {tag: "#Education"})

// TWEETS
CREATE (t1:Tweet {text: "The #Elections2025 will bring big changes!", sentiment: "positive", engagement: 300})
CREATE (t2:Tweet {text: "The #Economy needs urgent reform.", sentiment: "negative", engagement: 500})
CREATE (t3:Tweet {text: "Investing in #Education is the best path.", sentiment: "positive", engagement: 800})
CREATE (t4:Tweet {text: "Following the #Elections2025 updates!", sentiment: "neutral", engagement: 200})

// RELATIONSHIPS
CREATE (u1)-[:POSTED]->(t1)
CREATE (u2)-[:POSTED]->(t2)
CREATE (u3)-[:POSTED]->(t3)
CREATE (u2)-[:POSTED]->(t4)

CREATE (t1)-[:USES]->(h1)
CREATE (t2)-[:USES]->(h2)
CREATE (t3)-[:USES]->(h3)
CREATE (t4)-[:USES]->(h1)

CREATE (t2)-[:MENTIONS]->(u1)
CREATE (u1)-[:FOLLOWS]->(u3)
CREATE (u2)-[:FOLLOWS]->(u1)
