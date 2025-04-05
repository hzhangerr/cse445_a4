<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>Hotels Directory</title>
				<style>
					body { font-family: Arial; margin: 20px; }
					.hotel { border: 1px solid #ddd; padding: 15px; margin-bottom: 10px; }
					.rating { color: green; font-weight: bold; }
				</style>
			</head>
			<body>
				<h1>Hotels</h1>
				<xsl:for-each select="Hotels/Hotel">
					<div class="hotel">
						<h2>
							<xsl:value-of select="Name"/>
							<span class="rating">
								(Rating: <xsl:value-of select="@_Rating"/>)
							</span>
						</h2>
						<h3>Phones:</h3>
						<ul>
							<xsl:for-each select="Phone">
								<li>
									<xsl:value-of select="."/>
								</li>
							</xsl:for-each>
						</ul>
						<h3>Address:</h3>
						<p>
							<xsl:value-of select="Address/Number"/>,
							<xsl:value-of select="Address/Street"/>,
							<xsl:value-of select="Address/City"/>,
							<xsl:value-of select="Address/State"/>,
							<xsl:value-of select="Address/Zip"/>
							<xsl:if test="Address/@_NearestAirport">
								<br/>Nearest Airport: <xsl:value-of select="Address/@_NearestAirport"/>
							</xsl:if>
						</p>
					</div>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>