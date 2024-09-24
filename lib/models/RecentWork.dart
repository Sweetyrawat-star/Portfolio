class RecentWork {
  final String ?image;
  final String ?category;
  final String  ?title;
  final String  ?description;
  final String ?iosLink;
  final String  ?andiordLink;
  final String ? repoLink;

  final int ?id;

  RecentWork({this.id, this.image, this.category, this.title,this.iosLink, this.andiordLink, this.repoLink,this.description, });
}

// Demo List of my works
List<RecentWork> recentWorks = [
  RecentWork(
    id: 1,
    title: 'Polifyx',
    category: 'Mobile App Development',
    image: "assets/apps_images/app_logo.png",
    andiordLink: 'https://play.google.com/store/search?q=polifyx&c=apps&hl=en&gl=US',
    repoLink: "",
    iosLink: 'https://apps.apple.com/in/app/polifyx/id1623606564',
    description: 'Polifyx is insurance complain app where user can solve all insurance related problems, where having feature know your policy, health claim reimbursements, portfolio services and many more. Having live vedio streaming feature and feedback services and get notify all users about the policy update this is b2c services app',

  ),
  RecentWork(
    id: 2,
    title: "PSA",
    category: 'Mobile App Development',
    image: 'assets/apps_images/psa.jpeg',
    andiordLink: 'https://play.google.com/store/search?q=polifyx&c=apps&hl=en&gl=US',
    iosLink: "",
    repoLink: "",
    description: 'Project-SalesAchieverm CRM is a powerful and easy -to-use CRM specifically designed to manage the complex sales process around the Construction Industry. Used by Architects, Engineers, Contractors, and Suppliers worldwide, Project-SalesAchiever CRM gives companies in the Construction Industry an affordable solution that is simple to use and quick to deploy.',

  ),
  RecentWork(
    id: 3,
    title: 'CoRun',
    category: 'Mobile App Development',
    image: 'assets/apps_images/CoRun.jpeg',
    andiordLink: 'https://play.google.com/store/apps/details?id=com.app.co_run_final',
    iosLink: 'https://apps.apple.com/app/corun/idl643092744',
    repoLink: "",
    description: ' Grow a global community of running sports lovers to help them meet, enjoy and share their passion. CoRUN is a global and simple mobile application to help runners get together. Meet running partners everywhere and find and connect immediately. Feel safe to run anytime, anywhere, easily create private running events, manage online training calendars, and connect directly to running events.',
  ),
  RecentWork(
    id: 4,
    title: 'Polifyx Partner',
    category: 'Mobile App Development',
    image: 'assets/apps_images/polyfixPartner.png',
    andiordLink: 'https://play.google.com/store/apps/details?id=com.partner.polifyx&hl=en -IN',
    iosLink: 'https://apps.apple.com/in/app/polifyx-id6443657308',
    repoLink: "",
    description: 'Polifyx Partner App offers a variety of solutions to manage your customers and subordinates, from uploading insurance policies to managing portfolio, uploading insurance claim complaints and tracking real-time updates, getting payout details, and analysing customised reports.',
  ),
  RecentWork(
    id: 5,
    title: 'BookClub',
    category: 'Mobile App Development',
    image: 'assets/apps_images/bookhub.png',
    repoLink: 'https://github.com/Sweetyrawat-star/book_hub',
    andiordLink: "",
    iosLink: "",
    description: 'This project is all about bookhub where you can see free pdf books and download it and also you can add your book as well.',
  ),
  RecentWork(
    id: 6,
    title: 'Skytacos',
    category: 'Mobile App Development',
    image:  'assets/apps_images/skytacos.png',
    repoLink: 'https://github.com/Sweetyrawat-star/skytacos_app',
    andiordLink: "",
    iosLink: "",
    description:  'A food delivery app where user can add do payment and order multiple food at their home.',
  ),
  RecentWork(
    id: 7,
    title: 'kargerUmzuge',
    category: 'Mobile App Development',
    image:  'assets/apps_images/manfred-karger.png',
    repoLink: 'https://github.com/Sweetyrawat-star/manfred%20karge',
    andiordLink: "",
    iosLink: "",
    description: 'kargerUmzuge is basically a transport app where user can import their product anywhere. and having client detail and booking of transport using the calls feature.',
  ),
  RecentWork(
    id: 8,
    title: 'doctorconnext',
    category:'Mobile App Development',
    image: 'assets/apps_images/logo docbot.png',
    repoLink: 'https://github.com/Sweetyrawat-star/doctorconnext',
    andiordLink: "",
    iosLink: "",
    description:'doctorconnext is basically taking a appointment with doctor and consult free for their disease and symptoms',
  ),
  RecentWork(
    id: 8,
    title: '4everInLove',
    category:'Mobile App Development',
    image: 'assets/apps_images/4everInLove.png',
    repoLink: '',
    andiordLink: "https://play.google.com/store/apps/details?id=com.f4everinlove.off",
    iosLink: "https://apps.apple.com/in/app/4everinlove-perfect-match/id6468990355",
    description:'f4everinlove is basically matrimony app where you can find your soulmate',
  ),
];
