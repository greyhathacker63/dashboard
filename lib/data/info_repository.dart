import 'package:dashboard/models/info_model.dart';

class InfoRepository {
  Future<List<InfoItem>> fetchInfoItems() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      InfoItem(
        id: 'ai_overview',
        title: 'What is Artificial Intelligence?',
        shortDescription:
            'AI refers to the simulation of human intelligence in machines.',
        longDescription:
            'Artificial Intelligence (AI) is a broad field of computer science that gives computers the ability to perform human-like tasks. This includes learning, problem-solving, decision-making, perception, and language understanding. AI can be categorized into narrow AI (ANI), general AI (AGI), and super AI (ASI).',
        category: 'Basics',
        imageUrl:
            'https://itbrief.com.au/uploads/story/2023/11/27/img-d320oqYWscvU8q8HLX0brOyX.webp',
      ),
      InfoItem(
        id: 'ml_basics',
        title: 'Machine Learning Fundamentals',
        shortDescription:
            'ML is a subset of AI focused on systems that learn from data.',
        longDescription:
            'Machine Learning (ML) is a core component of AI, enabling systems to learn from data without explicit programming. It involves algorithms that build a model from sample data, known as "training data", in order to make predictions or decisions without being explicitly programmed to perform the task. Key types include supervised, unsupervised, and reinforcement learning.',
        category: 'ML',
        imageUrl:
            'https://www.bluefin.com/wp-content/uploads/2020/08/ai-future.jpg',
      ),
      InfoItem(
        id: 'dl_intro',
        title: 'Introduction to Deep Learning',
        shortDescription:
            'Deep Learning uses neural networks with many layers.',
        longDescription:
            'Deep Learning (DL) is a specialized branch of Machine Learning that uses artificial neural networks with multiple layers (hence "deep"). These networks are inspired by the structure and function of the human brain. DL has revolutionized areas like image recognition, natural language processing, and speech recognition due to its ability to learn complex patterns from vast amounts of data.',
        category: 'DL',
        imageUrl:
            'https://i0.wp.com/www.wi6labs.com/wp-content/uploads/2019/12/Machine-learning-logo-1.png?ssl=1',
      ),
      InfoItem(
        id: 'nlp_apps',
        title: 'Natural Language Processing (NLP)',
        shortDescription:
            'NLP enables computers to understand and process human language.',
        longDescription:
            'Natural Language Processing (NLP) is a field of AI that focuses on the interaction between computers and human (natural) language. It involves techniques for computers to understand, interpret, and generate human language. Applications include chatbots, sentiment analysis, machine translation, and text summarization.',
        category: 'NLP',
        imageUrl:
            'https://media.geeksforgeeks.org/wp-content/uploads/20240319155102/what-is-ai-artificial-intelligence.webp',
      ),
      InfoItem(
        id: 'cv_tech',
        title: 'Computer Vision Technologies',
        shortDescription:
            'Computer Vision allows machines to "see" and interpret images.',
        longDescription:
            'Computer Vision (CV) is an interdisciplinary field that deals with how computers can gain high-level understanding from digital images or videos. It aims to automate tasks that the human visual system can do. Key applications include facial recognition, object detection, autonomous vehicles, and medical image analysis.',
        category: 'CV',
        imageUrl:
            'https://www.shutterstock.com/image-photo/physician-patient-examine-holographic-body-600nw-2577081433.jpg',
      ),
      InfoItem(
        id: 'ethical_ai',
        title: 'Ethical Considerations in AI',
        shortDescription:
            'Discussing fairness, transparency, and accountability in AI.',
        longDescription:
            'As AI becomes more pervasive, ethical considerations are paramount. This includes addressing issues of bias in data and algorithms, ensuring transparency in AI decision-making, maintaining accountability for AI systems, and protecting privacy. Responsible AI development is crucial for societal well-being.',
        category: 'Ethics',
        imageUrl:
            'https://news.columbia.edu/sites/default/files/styles/cu_crop/public/content/2023/artificial-intelligence.jpg?itok=8KSVUG8e',
      ),
    ];
  }
}
