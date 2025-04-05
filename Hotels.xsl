<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Hotels Directory</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 2rem; }
          .hotel { border: 1px solid #ddd; padding: 1rem; margin-bottom: 1rem; border-radius: 5px; }
          .rating { color: #2ecc71; font-weight: bold; }
          .address { margin-top: 0.5rem; color: #666; }
          h2 { color: #3498db; margin-bottom: 0.5rem; }
          ul { list-style-type: none; padding-left: 0; }
          li:before { content: "📞 "; }
        </style>
      </head>
      <body>
        <h1>Hotel Directory</h1>
        <xsl:for-each select="Hotels/Hotel">
          <div class="hotel">
            <h2>
              <xsl:value-of select="Name"/>
              <xsl:if test="@Rating">
                <span class="rating"> (Rating: <xsl:value-of select="@Rating"/>)</span>
              </xsl:if>
            </h2>
            
            <div class="phones">
              <strong>Phone Numbers:</strong>
              <ul>
                <xsl:for-each select="Phone">
                  <li><xsl:value-of select="."/></li>
                </xsl:for-each>
              </ul>
            </div>

            <div class="address">
              <strong>Address:</strong><br/>
              <xsl:value-of select="Address/Number"/>, 
              <xsl:value-of select="Address/Street"/><br/>
              <xsl:value-of select="Address/City"/>, 
              <xsl:value-of select="Address/State"/> 
              <xsl:value-of select="Address/Zip"/><br/>
              <em>Nearest Airport: </em>
              <xsl:value-of select="Address/@NearstAirport"/>
            </div>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
