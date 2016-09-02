int[] lightningBolt1;
int[] lightningBolt1Color;
int[] lightningBolt2;
int[] lightningBolt2Color;
int[] lightningBolt3;
int[] lightningBolt3Color;
int[] lightningBolt4;
int[] lightningBolt4Color;
int[] lightningBolt5;
int[] lightningBolt5Color;
int[] lightningBolt6;
int[] lightningBolt6Color;
int counter = 0;
int finalCounter = 0;
void setup()
{
  size(1000,600);
}
void draw()
{
	background(255);
	drawline();
	fill(255);
	stroke(0);
	ellipse(500,300,10,10);
	line(497,300,503,300);
	line(500,297,500,303);
	ellipse(6,300,10,10);
	ellipse(500,6,10,10);
	ellipse(994,300,10,10);
	ellipse(500,594,10,10);
}
int lineMeasureMouseX (int mouseofX)
{
	int delta = mouseofX - 500;
	delta = (int)(absoluteVaule(delta));
	return delta;
}
int lineMeasureMouseY (int mouseofY)
{
	int delta = mouseofY - 300;
	delta = (int)(absoluteVaule(delta));
	return delta;
}
int hypotonuse(int deltaX, int deltaY)
{
	int finalDelta;
	finalDelta = (int)(sqrt(sq(deltaX)+sq(deltaY)));
	return finalDelta;
}
double absoluteVaule (double num)
{
	if (num < 0)
	{
		num = num * -1;
	}
	return num;
}
int lightningSections(int hypotonuseNum)
{
	int sections = (int)((Math.random()*((hypotonuseNum-1)/10))+1);
	return sections;
}
int[] lightning()
{
	int preX = 500;
	int preY = 300;
	int totalX = lineMeasureMouseX(mouseX);
	int totalY = lineMeasureMouseY(mouseY);
	int sections = lightningSections(hypotonuse(totalX,totalY));
	int sectionX = (int)(totalX/sections);
	int sectionY = (int)(totalY/sections);
	int xFreedom;
	int yFreedom;
	if (sections > 1)
	{
		xFreedom = (int)(((totalX/sections)*(5))/(sections-1));
		yFreedom = (int)(((totalY/sections)*(5))/(sections-1));
	}
	else
	{
		xFreedom = 0;
		yFreedom = 0;
	}
	int direction = findQuadrant(mouseX,mouseY);
	int[] sparkBolt = new int[4*sections];
	int finalX = 500;
	int finalY = 300;
	if (direction == 1)
	{
		for(int i = 0;i<sections-1;i=i+1)
		{
			finalX = preX + (int)((Math.random()*(sectionX + (2*xFreedom)))-xFreedom);
			finalY = preY - (int)((Math.random()*(sectionY + (2*yFreedom)))-yFreedom);
			sparkBolt[i*4] = preX;
			sparkBolt[(i*4)+1] = preY;
			sparkBolt[(i*4)+2] = finalX;
			sparkBolt[(i*4)+3] = finalY;
			preX = finalX;
			preY = finalY;
		}
		sparkBolt[((sections-1)*4)] = finalX;
		sparkBolt[((sections-1)*4)+1] = finalY;
		sparkBolt[((sections-1)*4)+2] = mouseX;
		sparkBolt[((sections-1)*4)+3] = mouseY;
	}
	else if (direction == 2)
	{
		for(int i = 0;i<sections-1;i=i+1)
		{
			finalX = preX + (int)((Math.random()*(sectionX + (2*xFreedom)))-xFreedom);
			finalY = preY + (int)((Math.random()*(sectionY + (2*yFreedom)))-yFreedom);
			sparkBolt[i*4] = preX;
			sparkBolt[(i*4)+1] = preY;
			sparkBolt[(i*4)+2] = finalX;
			sparkBolt[(i*4)+3] = finalY;
			preX = finalX;
			preY = finalY;
		}
		sparkBolt[((sections-1)*4)] = finalX;
		sparkBolt[((sections-1)*4)+1] = finalY;
		sparkBolt[((sections-1)*4)+2] = mouseX;
		sparkBolt[((sections-1)*4)+3] = mouseY;
	}
	else if (direction == 3)
	{
		for(int i = 0;i<sections-1;i=i+1)
		{
			finalX = preX - (int)((Math.random()*(sectionX + (2*xFreedom)))-xFreedom);
			finalY = preY + (int)((Math.random()*(sectionY + (2*yFreedom)))-yFreedom);
			sparkBolt[i*4] = preX;
			sparkBolt[(i*4)+1] = preY;
			sparkBolt[(i*4)+2] = finalX;
			sparkBolt[(i*4)+3] = finalY;
			preX = finalX;
			preY = finalY;
		}
		sparkBolt[((sections-1)*4)] = finalX;
		sparkBolt[((sections-1)*4)+1] = finalY;
		sparkBolt[((sections-1)*4)+2] = mouseX;
		sparkBolt[((sections-1)*4)+3] = mouseY;
	}
	else if (direction == 4)
	{
		for(int i = 0;i<sections-1;i=i+1)
		{
			finalX = preX - (int)((Math.random()*(sectionX + (2*xFreedom)))-xFreedom);
			finalY = preY - (int)((Math.random()*(sectionY + (2*yFreedom)))-yFreedom);
			sparkBolt[i*4] = preX;
			sparkBolt[(i*4)+1] = preY;
			sparkBolt[(i*4)+2] = finalX;
			sparkBolt[(i*4)+3] = finalY;
			preX = finalX;
			preY = finalY;
		}
		sparkBolt[((sections-1)*4)] = finalX;
		sparkBolt[((sections-1)*4)+1] = finalY;
		sparkBolt[((sections-1)*4)+2] = mouseX;
		sparkBolt[((sections-1)*4)+3] = mouseY;
	}
	return sparkBolt;
}
void drawline()
{
	if (mousePressed == true)
	{
		stroke(255);
		fill(0);
		line(500,300,mouseX,mouseY);
		ellipse(mouseX,mouseY,3,3);
		drawlightning();
	}
	else
	{
		counter = 0;
		finalCounter = 0;
		int[] lightningBoltReset = {500,300,500,300};
		lightningBolt1 = lightningBoltReset;
		lightningBolt2 = lightningBoltReset;
		lightningBolt3 = lightningBoltReset;
		lightningBolt4 = lightningBoltReset;
		lightningBolt5 = lightningBoltReset;
		lightningBolt6 = lightningBoltReset;
	}
}
void drawlightning()
{
	counter = counter + 1;
	finalCounter = finalCounter+1;
	if (counter == 1)
	{
		lightningBolt1 = lightning();
		lightningBolt1Color = colorFinding();
	}
	else if (counter == 2)
	{
		lightningBolt2 = lightning();
		lightningBolt2Color = colorFinding();
	}
	else if (counter == 3)
	{
		lightningBolt3 = lightning();
		lightningBolt3Color = colorFinding();
	}
	else if (counter == 4)
	{
		lightningBolt4 = lightning();
		lightningBolt4Color = colorFinding();
	}
	else if (counter == 5)
	{
		lightningBolt5 = lightning();
		lightningBolt5Color = colorFinding();
	}
	else if (counter == 6)
	{
		lightningBolt6 = lightning();
		lightningBolt6Color = colorFinding();
	}
	else if (counter > 6)
	{
		counter = 0;
	}
	if (finalCounter > 60)
	{
		for(int i = 0;i<(lightningBolt1.length/4);i=i+1)
		{
			stroke(lightningBolt1Color[0], lightningBolt1Color[1], lightningBolt1Color[2]);
			line(lightningBolt1[i*4],lightningBolt1[(i*4)+1],lightningBolt1[(i*4)+2],lightningBolt1[(i*4)+3]);
		}
		fill(lightningBolt1Color[0], lightningBolt1Color[1], lightningBolt1Color[2]);
		ellipse(lightningBolt1[(lightningBolt1.length)-2],lightningBolt1[(lightningBolt1.length)-1],5,5);
		for(int i = 0;i<(lightningBolt2.length/4);i=i+1)
		{
			stroke(lightningBolt2Color[0], lightningBolt2Color[1], lightningBolt2Color[2]);
			line(lightningBolt2[i*4],lightningBolt2[(i*4)+1],lightningBolt2[(i*4)+2],lightningBolt2[(i*4)+3]);
		}
		fill(lightningBolt2Color[0], lightningBolt2Color[1], lightningBolt2Color[2]);
		ellipse(lightningBolt2[(lightningBolt2.length)-2],lightningBolt2[(lightningBolt2.length)-1],5,5);
		for(int i = 0;i<(lightningBolt3.length/4);i=i+1)
		{
			stroke(lightningBolt3Color[0], lightningBolt3Color[1], lightningBolt3Color[2]);
			line(lightningBolt3[i*4],lightningBolt3[(i*4)+1],lightningBolt3[(i*4)+2],lightningBolt3[(i*4)+3]);
		}
		fill(lightningBolt3Color[0], lightningBolt3Color[1], lightningBolt3Color[2]);
		ellipse(lightningBolt3[(lightningBolt3.length)-2],lightningBolt3[(lightningBolt3.length)-1],5,5);
		for(int i = 0;i<(lightningBolt4.length/4);i=i+1)
		{
			stroke(lightningBolt4Color[0], lightningBolt4Color[1], lightningBolt4Color[2]);
			line(lightningBolt4[i*4],lightningBolt4[(i*4)+1],lightningBolt4[(i*4)+2],lightningBolt4[(i*4)+3]);
		}
		fill(lightningBolt4Color[0], lightningBolt4Color[1], lightningBolt4Color[2]);
		ellipse(lightningBolt4[(lightningBolt4.length)-2],lightningBolt4[(lightningBolt4.length)-1],5,5);
		for(int i = 0;i<(lightningBolt5.length/4);i=i+1)
		{
			stroke(lightningBolt5Color[0], lightningBolt5Color[1], lightningBolt5Color[2]);
			line(lightningBolt5[i*4],lightningBolt5[(i*4)+1],lightningBolt5[(i*4)+2],lightningBolt5[(i*4)+3]);
		}
		fill(lightningBolt5Color[0], lightningBolt5Color[1], lightningBolt5Color[2]);
		ellipse(lightningBolt5[(lightningBolt5.length)-2],lightningBolt5[(lightningBolt5.length)-1],5,5);
		for(int i = 0;i<(lightningBolt6.length/4);i=i+1)
		{
			stroke(lightningBolt6Color[0], lightningBolt6Color[1], lightningBolt6Color[2]);
			line(lightningBolt6[i*4],lightningBolt6[(i*4)+1],lightningBolt6[(i*4)+2],lightningBolt6[(i*4)+3]);
		}
		fill(lightningBolt6Color[0], lightningBolt6Color[1], lightningBolt6Color[2]);
		ellipse(lightningBolt6[(lightningBolt6.length)-2],lightningBolt6[(lightningBolt6.length)-1],5,5);
	}
}
int findQuadrant(int mouseofX, int mouseofY)
{
	int quadrant;
	if (mouseofX > 500)
	{
		if (mouseofY < 300)
		{
			quadrant = 1;
		}
		else
		{
			quadrant = 2;
		}
	} 
	else
	{
		if (mouseofY > 300)
		{
			quadrant = 3;
		}
		else 
		{
			quadrant = 4;
		}
	}
	return quadrant;
}
int[] colorFinding()
{
	int[] tempColour= new int[3];
	tempColour[0] = (int)(Math.random()*255);
	tempColour[1] = (int)(Math.random()*255);
	tempColour[2] = (int)(Math.random()*255);
	return tempColour;
}