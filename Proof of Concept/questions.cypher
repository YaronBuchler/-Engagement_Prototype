// Quem menciona quem
MATCH (a:User)-[:POSTED]->(t:Tweet)-[:MENTIONS]->(b:User)
RETURN a.name AS author, b.name AS mentioned, count(t) AS mentions
ORDER BY mentions DESC;
// Siga a rede (quem segue quem)
MATCH (a:User)-[:FOLLOWS]->(b:User)
RETURN a.name, collect(b.name) AS follows;



🔹 Popularity of content

// Tuítes mais populares
MATCH (t:Tweet)
RETURN t.text, t.engagement
ORDER BY t.engagement DESC
LIMIT 5;

// Usuários com maior engajamento médio
MATCH (u:User)-[:POSTED]->(t:Tweet)
RETURN u.name, avg(t.engagement) AS avgEngagement
ORDER BY avgEngagement DESC;

// Hashtags com maior engajamento médio

MATCH (t:Tweet)-[:USES]->(h:Hashtag)
RETURN h.tag, avg(t.engagement) AS avgEngagement
ORDER BY avgEngagement DESC;


🔹 Communities of interest (users who talk about similar things)

// Usuários conectados por hashtags compartilhadas
MATCH (u1:User)-[:POSTED]->(:Tweet)-[:USES]->(h:Hashtag)<-[:USES]-(:Tweet)<-[:POSTED]-(u2:User)
WHERE u1 <> u2
RETURN u1.name, u2.name, collect(DISTINCT h.tag) AS commonHashtags
ORDER BY size(commonHashtags) DESC;