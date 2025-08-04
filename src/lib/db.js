import mysql from "mysql2/promise";

const dbConfig = {
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD || "",
  database: process.env.DB_NAME || "db_kips_erp",
  port: process.env.DB_PORT || 3306,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
};

let pool;

export async function getConnection() {
  if (!pool) {
    pool = mysql.createPool(dbConfig);
  }
  return pool;
}

export async function query(sql, params = []) {
  const connection = await getConnection();
  try {
    const [rows] = await connection.execute(sql, params);
    return rows;
  } catch (error) {
    console.error("Database query error:", error);
    throw error;
  }
}

export async function getTableData(tableName, limit = 100) {
  try {
    const sql = `SELECT * FROM ${tableName} LIMIT ?`;
    return await query(sql, [limit]);
  } catch (error) {
    console.error(`Error fetching data from ${tableName}:`, error);
    return [];
  }
}

export async function searchDatabase(searchTerm) {
  try {
    // Search across multiple relevant tables
    const tables = [
      "tbl_applicants",
      "tbl_programs",
      "tbl_campuses",
      "tbl_sessions",
      "tbl_fee_structure",
      "tbl_staff_basic",
    ];

    let allResults = [];

    for (const table of tables) {
      try {
        // Get table structure to find text columns
        const columns = await query(`DESCRIBE ${table}`);
        const textColumns = columns
          .filter(
            (col) =>
              col.Type.includes("varchar") ||
              col.Type.includes("text") ||
              col.Type.includes("char")
          )
          .map((col) => col.Field);

        if (textColumns.length > 0) {
          const whereClause = textColumns
            .map((col) => `${col} LIKE ?`)
            .join(" OR ");

          const sql = `SELECT *, '${table}' as source_table FROM ${table} WHERE ${whereClause} LIMIT 10`;
          const params = textColumns.map(() => `%${searchTerm}%`);

          const results = await query(sql, params);
          allResults.push(...results);
        }
      } catch (error) {
        console.error(`Error searching table ${table}:`, error);
      }
    }

    return allResults;
  } catch (error) {
    console.error("Database search error:", error);
    return [];
  }
}
