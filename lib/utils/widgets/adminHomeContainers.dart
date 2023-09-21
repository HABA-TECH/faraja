import 'package:flutter/material.dart';
import 'package:haba/utils/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../TextStyles.dart';
import '../paddingUtil.dart';

class AdminHomeContainers extends StatefulWidget {
  const AdminHomeContainers({super.key});

  @override
  State<AdminHomeContainers> createState() => _AdminHomeContainersState();
}

class _AdminHomeContainersState extends State<AdminHomeContainers> {
  String businessIdeas =
      """STEPS TOWARDS BUILDING VIABLE BUSINESS IDEA\n\n Step 1: Self-assessment and goal setting
    - Take some time to reflect on your passions, skills, and expertise. Consider what you enjoy doing and what you're good at.
    - Define your financial goals clearly. Determine the specific amount of money you want to make and the timeline you wish to achieve these goals.
    
    Step 2: Market research
    - Research different industries and sectors to identify potential opportunities. Look for areas that have growth potential, low competition, and high demand.
    - Analyze current trends, consumer preferences, and emerging technologies that may influence business opportunities.
    
    Step 3: Identify problems and pain points
    - Think about common problems people face in their daily lives or challenges that businesses encounter. Identifying these pain points can lead to potential business ideas to address these issues.
    
    Step 4: Brainstorming sessions
    - Conduct brainstorming sessions, either alone or with a group, to generate a wide range of business ideas. Encourage creativity and do not judge any idea at this stage.
    
    Step 5: Evaluate feasibility and profitability
    - Once you have a list of potential business ideas, assess each one's feasibility and profitability. Consider factors such as startup costs, required resources, potential revenue, and scalability.
    
    Step 6: Match with your skills and interests
    - Narrow down the list to business ideas that align with your skills, interests, and expertise. Passion and enthusiasm can play a crucial role in the success of a business venture.
    
    Step 7: Validate the idea
    - Conduct market research and surveys to validate the demand for your chosen business idea. Gather feedback from potential customers to understand their needs and preferences.
    
    Step 8: Seek feedback and advice
    - Share your business idea with friends, family, mentors, or industry experts. Their feedback and advice can provide valuable insights and help you make necessary adjustments.
    
    """;
  String ideaDevelopment = """
IDEA DEVELOPMENT PROCESS

1. Idea generation - Finding the right business Idea.
2. Screening Idea - Deciding which idea to pursue.
                    Considering : customer needs,highest profits,goals of the business, technical feasibility and competition it the market.
3. Developing an idea - at this stage you develop a prototype,product design,creating a product, creating a patent.
4. Research - collecting information about a market place to determine whether or not there is demand for the product.
5. Testing an idea - Through focus groups, by giving free samples, by attending fairs and market.
6. Launching an idea - This usually the last stage supported by an appropriate marketing.""";
  String businessGoals = """
BUSSINESS GOALS

You must have a way to measure or evaluate success and failure in your business.
You should have clear and specific goals when diving to unkown business venture and have a picture  from the start of the project.
Your goals and objective should be:
     1. SPECIFIC
     2. MEASURABLE
     3. ATTAINABLE
     4. RELEVANT
     5. TIME BASED.
This will help you turn your dream to reality.

          WAYS TO EVALUATE YOUR BUSINESS

1. Profitability
2. Job creation
3. Market shares
4. Customers satisfactions.
5. Socio-Economic and ethical considerations.""";
  String businessPlan = """
BUSINESS PLAN

       OUTLINE
1. Executive summary : summarises the plan in a nutshell.
2. Company summary : Where you introduce the business in details; overview,location,key personell,goals and objectives,strength and weakness,company structure and mission and vision of the company.
3. Products and services : description, costs of sales ,future projection,legal concerns
4. Marketing strategies : Research,competition,marketing and sales strategies.
5 Operational information : overhead cost,suppliers, quality control,distribution,employees,assets and equipment, adversory board, insuarance policies,licence and permits.
6. Financial information.
7. Funding requairements
8. Appendix""";
  String taxes = """
TAXES

TYPES OF TAXES
As an upcoming business person its good to understand about taxes which can be relevant to your business. Below are types of taxes imposed in various sectors of economy.

1. INCOME TAX
    Tax charged each year on your income whether resident or non-resident.
    methods of collecting income taxes : corporation tax,pay as you earn(PAYE),withholding tax,advance tax,installment tax,rental income tax.

2. VALUE ADDED TAX(VAT):
tax charged on taxable goods and services.

3. EXCISE DUTY:
tax imposed on goods manufactured in Kenya or imported

4. CAPITAL GAIN TAX.
Tax charged on the whole gain which accrues to a company or individual upon transfer of property.

5. AGENCY REVENUE:
Type of payment that KRA collects on behalf of various revenue collection agencies.""";
  String typesofTaxes = """
TYPES OF TAXES
As an upcoming business person its good to understand about taxes which can be relevant to your business. Below are types of taxes imposed in various sectors of economy.

1. INCOME TAX
    Tax charged each year on your income whether resident or non-resident.
    methods of collecting income taxes : corporation tax,pay as you earn(PAYE),withholding tax,advance tax,installment tax,rental income tax.

2. VALUE ADDED TAX(VAT):
tax charged on taxable goods and services.

3. EXCISE DUTY:
tax imposed on goods manufactured in Kenya or imported

4. CAPITAL GAIN TAX.
Tax charged on the whole gain which accrues to a company or individual upon transfer of property.

5. AGENCY REVENUE:
Type of payment that KRA collects on behalf of various revenue collection agencies.""";
  String questions = """
QUESTONS TO ASK YOURSELF

1. What are the disadvantages and advantages of starting a business?
2. Is there a need/demand for the product/service?
3. Am i passionate about the idea?
4. Is it financially viable?
5. Are there any competitions?
6. Can i put a realistic plan in place to start my business?
7. Do I have skills and expertise to make it happen?
8. What are the resources needed to start the business.""";
  String marketPlan = """
MARKET PLAN
The market plan is a comprehensive strategy that will guide our business towards achieving its financial goals by effectively reaching and engaging with our target market. Our primary objective is to penetrate the market and gain a substantial market share within the next three years.

Market Research: We will start by conducting thorough market research to identify our target audience's preferences, needs, and behaviors. Understanding their pain points and desires will enable us to tailor our products and marketing messages accordingly.

Target Market Segmentation: Based on our research, we will segment the market into distinct groups with specific characteristics. This will allow us to create targeted marketing campaigns for each segment, ensuring maximum impact and efficiency.

Unique Selling Proposition (USP): To differentiate ourselves from competitors, we will develop a compelling USP that highlights the unique benefits of our products. Our USP will resonate with our target market and create a memorable brand identity.

Product Strategy: We will continually innovate and enhance our product offerings to meet evolving customer demands. This will involve gathering feedback from customers and staying up-to-date with industry trends.

Pricing Strategy: Our pricing strategy will strike a balance between profitability and competitiveness. We will analyze market dynamics and consumer perceptions to determine optimal pricing for our products.

Distribution Channels: Identifying the most efficient distribution channels is crucial. We will evaluate options such as direct sales, partnerships, and e-commerce platforms to ensure convenient access for customers.""";
  String financeandLoans = """
FINANCE.

When starting a business one should always have capital- money to start the business.
The capital varies from one business to another.It is however advisable to start from a small business then grow it up slowly by slowly as you learn the market.
there are various ways you can get your capital, these includes:

1. From your savings. Saving money to start a business.
2. Soft loans: Loans from friends and family sometimes with less interest or no interest.
3. investors : After selling your business idea you can attract people who are willing to pump there money to your idea.
4. Selling property : You can sell some of your properties to start a business.
5. Bank Loan : You can borrow a loan from the bank.
6. Mobile apps Lenders : You can borrow from e-microfinance companies like fintec, Tala etc.

N/B When borrowing a loan make sure the institution you borrowing from is a good one and you have done quite a good research about it. Talk to there manager incase you get a delay they can understand. In addition go for a flexible loan with flexible repayment period and reasonable interests.""";
  showModalSheet(String text) {
    return showMaterialModalBottomSheet(
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SingleChildScrollView(
        child: Container(
          // color: Colors.white,
          height: MediaQuery.of(context).size.height * 1.2,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
            ),
          ),

          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        color: Colors.transparent,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: AppPadding.regularPadding,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    text,
                    style: TextStyles.normal(
                      15,
                      Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalSheet(businessIdeas);

                      // Navigator.pushNamed(context, AppRouter.personalInfoHome);
                    },
                    child: CustomHomeContainer(
                        height: 140,
                        icon: Icons.lightbulb,
                        text: 'Business Ideas',
                        color: AppColors.greyPAGEBLUE),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalSheet(financeandLoans);

                      // Navigator.pushNamed(context, AppRouter.personalInfoHome);
                    },
                    child: CustomHomeContainer(
                        height: 140,
                        icon: Icons.attach_money_outlined,
                        text: 'Finance and Loans',
                        color: Colors.purple[900]),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalSheet(ideaDevelopment);

                      // Navigator.pushNamed(context, AppRouter.personalInfoHome);
                    },
                    child: CustomHomeContainer(
                        height: 100,
                        icon: Icons.light_mode_sharp,
                        text: 'Idea Development',
                        color: Colors.amber[800]),
                  ),
                  InkWell(
                    onTap: () {
                      showModalSheet(marketPlan);
                      // Navigator.pushNamed(context, AppRouter.loanOffers);
                    },
                    child: CustomHomeContainer(
                      height: 140,
                      icon: Icons.pie_chart,
                      text: 'Market Plan',
                      color: AppColors.greyPINK,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  showModalSheet(businessGoals);
                },
                child: CustomHomeContainer(
                    height: 160,
                    icon: Icons.wallet,
                    text: 'Business Goals',
                    color: AppColors.greyLIGHTGREEN),
              ),
              GestureDetector(
                onTap: () {
                  showModalSheet(businessPlan);
                },
                child: CustomHomeContainer(
                    height: 120,
                    icon: Icons.add_circle_outline_outlined,
                    text: 'Business Plans',
                    color: Colors.orange[300]),
              ),
              GestureDetector(
                onTap: () {
                  showModalSheet(questions);
                },
                child: CustomHomeContainer(
                    height: 120,
                    icon: Icons.question_mark_outlined,
                    text: 'Questions to ask Oneself',
                    color: AppColors.greyCYAN),
              ),
              GestureDetector(
                onTap: () {
                  showModalSheet(taxes);
                },
                child: const CustomHomeContainer(
                    height: 120,
                    icon: Icons.business_center,
                    text: 'Taxes',
                    color: Colors.brown),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomHomeContainer extends StatelessWidget {
  final double? height;
  final Color? color;
  final String? text;
  final IconData? icon;
  const CustomHomeContainer({
    super.key,
    required this.height,
    required this.color,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Container(
        width: MediaQuery.of(context).size.width * .445,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25,
            right: 5,
          ),
          child: Center(
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 30),
                    child: Container(
                        child: Text(text!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14))),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
