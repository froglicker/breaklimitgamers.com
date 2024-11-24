<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/squad">
        <html>
        <head>
            <title><xsl:value-of select="name"/> - Squad Info</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background: url('bg.jpg') no-repeat center center fixed;
                    background-size: cover;
                    margin: 0;
                    padding: 0;
                }
                header {
                    background-color: rgba(0, 0, 0, 0);
                    color: white;
                    padding: 20px;
                    text-align: center;
                }
                header img {
                    max-width: 150px;
                    display: block;
                    margin: 10px auto;
                }
                .container {
                    max-width: 600px;
                    margin: 40px auto;
                    background: rgba(255, 255, 255, 0.8);
                    padding: 20px;
                    border-radius: 8px;
                    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                }
                .squad-details {
                    text-align: center;
                }
                .squad-details h1 {
                    margin: 10px 0;
                    font-size: 2rem;
                }
                .squad-details p {
                    margin: 5px 0;
                    color: #555;
                }
                .members {
                    margin-top: 30px;
                }
                .member {
                    border-bottom: 1px solid #ddd;
                    padding: 15px 0;
                }
                .member:last-child {
                    border-bottom: none;
                }
                .member h2 {
                    margin: 0;
                    color: #007acc;
                    font-size: 1.5rem;
                }
                .member p {
                    margin: 5px 0;
                    color: #333;
                }
                .member .remark {
                    font-style: italic;
                    color: #666;
                }
            </style>
        </head>
        <body>
            <header>
                <img src="sqd_logo.png" alt="Squad Logo"/>
                <div class="squad-details">
                    <h1><xsl:value-of select="name"/></h1>
                    <p><xsl:value-of select="title"/></p>
                    <p><a href="mailto:{email}" style="color: white;"><xsl:value-of select="email"/></a> | <a href="http://{web}" target="_blank" style="color: white;"><xsl:value-of select="web"/></a></p>
                </div>
            </header>
            <div class="container">
                <div class="members">
                    <h2>Members</h2>
                    <xsl:for-each select="member">
                        <div class="member">
                            <h2><xsl:value-of select="@nick"/> (<xsl:value-of select="icq"/>)</h2>
                            <p><strong>Name:</strong> <xsl:value-of select="name"/></p>
                            <p><strong>Email:</strong> <xsl:choose>
                                <xsl:when test="email != 'N/A'"><a href="mailto:{email}"><xsl:value-of select="email"/></a></xsl:when>
                                <xsl:otherwise><xsl:text>Not available</xsl:text></xsl:otherwise>
                            </xsl:choose></p>
                            <p class="remark"><strong>Remark:</strong> "<xsl:value-of select="remark"/>"</p>
                        </div>
                    </xsl:for-each>
                </div>
            </div>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
