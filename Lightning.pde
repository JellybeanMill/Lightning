
void setup()
{
  size(1000,600);
}
void draw()
{
	background(255);
	drawline();
	fill(255);
	ellipse(500,300,10,10);

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
	int xFreedom = (int)(((totalX/sections)*(0.5))/(sections-1));
	int yFreedom = (int)(((totalY/sections)*(0.5))/(sections-1));
	int direction = findQuadrant(mouseX,mouseY);
	int[] sparkBolt = new int[4*sections];
	int finalX;
	int finalY;
	for(int i = 0,i<sections-1,i=i+1)
	{
		if (direction == 1)
		{
			for(int i = 0,i<sections-1,i=i+1)
			{
				finalX = preX + (int)((Math.random()*(sectionX + (2*xFreedom)))-xFreedom);
				finalY = preY - (int)((Math.random()*(sectionY + (2*yFreedom)))-yFreedom);
				sparkBolt[i*4] = preX;
				sparkBolt[(i*4)+1] = preY;
				sparkBolt[(i*4)+2] = finalX;
				sparkBolt[(1*4)+3] = finalY;
				preX = finalX;
				preY = finalY;
			}
			
		}
		else if (direction == 2)
		{
			finalX = preX + (int)((Math.random()*(sectionX + (2*xFreedom)))-xFreedom);
			finalY = preY + (int)((Math.random()*(sectionY + (2*yFreedom)))-yFreedom);
			sparkBolt[i*4] = preX;
			sparkBolt[(i*4)+1] = preY;
			sparkBolt[(i*4)+2] = finalX;
			sparkBolt[(1*4)+3] = finalY;
			preX = finalX;
			preY = finalY;
		}
		else if (direction == 3)
		{
			finalX = preX - (int)((Math.random()*(sectionX + (2*xFreedom)))-xFreedom);
			finalY = preY + (int)((Math.random()*(sectionY + (2*yFreedom)))-yFreedom);
			sparkBolt[i*4] = preX;
			sparkBolt[(i*4)+1] = preY;
			sparkBolt[(i*4)+2] = finalX;
			sparkBolt[(1*4)+3] = finalY;
			preX = finalX;
			preY = finalY;
		}
		else if (direction == 4)
		{
			finalX = preX - (int)((Math.random()*(sectionX + (2*xFreedom)))-xFreedom);
			finalY = preY - (int)((Math.random()*(sectionY + (2*yFreedom)))-yFreedom);
			sparkBolt[i*4] = preX;
			sparkBolt[(i*4)+1] = preY;
			sparkBolt[(i*4)+2] = finalX;
			sparkBolt[(1*4)+3] = finalY;
			preX = finalX;
			preY = finalY;
		}
	}
}
void drawline()
{
	if (mousePressed == true)
	{
		fill(255);
		line(500,300,mouseX,mouseY);
		ellipse(mouseX,mouseY,3,3);
	}
}
void findQuadrant(int mouseofX, int mouseofY)
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
}