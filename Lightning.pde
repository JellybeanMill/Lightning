
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
void lightning1()
{
	
	int totalX = lineMeasureMouseX(mouseX);
	int totalY = lineMeasureMouseY(mouseY);
	int sections = lightningSections(hypotonuse(totalX,totalY));
	for(int i = 0,i<sections-1,i=i+1)
	{
		
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

